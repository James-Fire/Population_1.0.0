--Modules
local stdlib = require('__stdlib__/stdlib/utils/string')
local MathData = require("prototypes/Data Script")
--My entities
local Housing_Beacon = "housing-beacon"
local Housing_Pos_Module = "housing-positive-speed-module"
local Housing_Neg_Module = "housing-negative-speed-module"
local Farming_Pos_Module = "farming-positive-speed-module"
local Farming_Neg_Module = "farming-negative-speed-module"
local Housing_Beaconed_Entities = {"sf-house", "mf-house", "low-rise", "ap-tower", "arcology-tower"}

local Per_Tile_Impact = 1
--Living Trees are good. Dead Trees bad.
local Per_Tree_Impact = 1

local PeriodicUpdateInterval = 10*60*60 --Recheck all housing and farm structures every so often, at 10 minutes right now.

function CheckTableValue(Value,Table)
	for i, v in pairs(Table) do
		if Value == v then
			return true
		end
	end
	return false
end
function areaAroundPosition(position, extraRange)
	if type(extraRange) ~= "number" then extraRange = 0 end
	return {
		{x = math.floor(position.x) - extraRange,     y = math.floor(position.y) - extraRange},
		{x = math.floor(position.x) + 1 + extraRange, y = math.floor(position.y) + 1 + extraRange}
	}
end
function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

--iscrafting() Table entry on an entity that tracks whether it is crafting




script.on_nth_tick(PeriodicUpdateInterval, function(event)
	--game.print("Update global update list and interval")
	global.counter = 0
	global.UpdateList = { }
	global.UpdateInterval = PeriodicUpdateInterval/((table_size(global.HousingList)+table_size(global.FarmList))+1)
	--game.print("Update Interval: "..tostring(global.UpdateInterval))
	for i, House in pairs(global.HousingList) do
		if House.valid then
			table.insert(global.UpdateList, House)
		else
			global.HousingList[i] = nil
		end
	end
	for i, Farm in pairs(global.FarmList) do
		if Farm.valid then
			table.insert(global.UpdateList, Farm)
		else
			global.FarmList[i] = nil
		end
	end
	--game.print(serpent.block(global.UpdateList))
end)

local function doSomething()
	global.counter = global.counter + 1
	--game.print("Global Counter: "..tostring(global.counter))
	if global.UpdateList[global.counter] == nil then
	else
		--game.print(serpent.block(global.UpdateList[global.counter]))
		if stdlib.contains(global.UpdateList[global.counter].name, "-farm") or global.UpdateList[global.counter].name == "fishery" then
			--game.print("Updating a "..tostring(global.UpdateList[global.counter].name))
			ManageFarmingBeacon(global.UpdateList[global.counter], global.UpdateList[global.counter].surface, global.UpdateList[global.counter].force, 3)
		elseif stdlib.contains(global.UpdateList[global.counter].name, "-house") or stdlib.contains(global.UpdateList[global.counter].name, "-tower") or stdlib.contains(global.UpdateList[global.counter].name, "-rise") then
			--game.print("Updating a "..tostring(global.UpdateList[global.counter].name))
			ManageHousingBeacon(global.UpdateList[global.counter], global.UpdateList[global.counter].surface, global.UpdateList[global.counter].force, MathData.HousingSize[3])
		end
	end
end

script.on_event(defines.events.on_tick, function(event)
	action = global.queue[event.tick]
	if not action then return end
	doSomething()
	global.queue[event.tick] = nil
	global.queue[event.tick + global.UpdateInterval] = action --Do the action every 60 ticks, (1s)
	--game.print("tick")
end)

script.on_init(function()
	global.Good_Water_Tiles_List = { }
	global.Good_Tiles_List = { }
	global.Bad_Tiles_List = { }
	global.Meh_Tiles_List = { }
	Processed_Tiles_List = { }
	global.Bad_Building_List = { "assembling-machine", "furnace", "generator", "boiler", "reactor", "heat-pipe", "pipe", "straight-rail", "curved-rail" }
	
	for _, tile in pairs(game.tile_prototypes) do
		if stdlib.contains(tile.name, "water") and stdlib.contains(tile.name, "green") and not CheckTableValue(tile.name, Processed_Tiles_List) and not CheckTableValue(tile.name, global.Good_Tiles_List) and not CheckTableValue(tile.name, global.Bad_Tiles_List) and not CheckTableValue(tile.name, global.Meh_Tiles_List) then
			table.insert(global.Bad_Tiles_List, tile.name)
			table.insert(Processed_Tiles_List, tile.name)
		elseif stdlib.contains(tile.name, "nuclear") and not CheckTableValue(tile.name, Processed_Tiles_List) and not CheckTableValue(tile.name, global.Good_Tiles_List) and not CheckTableValue(tile.name, global.Bad_Tiles_List) and not CheckTableValue(tile.name, global.Meh_Tiles_List) then
			table.insert(global.Bad_Tiles_List, tile.name)
			table.insert(Processed_Tiles_List, tile.name)
		elseif stdlib.contains(tile.name, "water") and not CheckTableValue(tile.name, Processed_Tiles_List) and not CheckTableValue(tile.name, global.Good_Tiles_List) and not CheckTableValue(tile.name, global.Bad_Tiles_List) and not CheckTableValue(tile.name, global.Meh_Tiles_List) then
			table.insert(global.Good_Water_Tiles_List, tile.name)
			table.insert(Processed_Tiles_List, tile.name)
		elseif stdlib.contains(tile.name, "grass") and not CheckTableValue(tile.name, Processed_Tiles_List) and not CheckTableValue(tile.name, global.Good_Tiles_List) and not CheckTableValue(tile.name, global.Bad_Tiles_List) and not CheckTableValue(tile.name, global.Meh_Tiles_List) then
			table.insert(global.Good_Tiles_List, tile.name)
			table.insert(Processed_Tiles_List, tile.name)
		elseif not CheckTableValue(tile.name, Processed_Tiles_List) and not CheckTableValue(tile.name, global.Good_Tiles_List) and not CheckTableValue(tile.name, global.Bad_Tiles_List) and not CheckTableValue(tile.name, global.Meh_Tiles_List) then
			table.insert(global.Meh_Tiles_List, tile.name)
			table.insert(Processed_Tiles_List, tile.name)
		end
	end
	local population_start = {
		["person"] = 40,
		["child-person"] = 80,
		["mf-house"] = 5,
		["wood"] = 100,
		["vegetables-farm"] = 2,
		["grain-farm"] = 2,
		["wood-farm"] = 2,
		["septic-tank"] = 5,
	}
	if remote.interfaces["freeplay"] then
		local freeplayStartItems = remote.call("freeplay", "get_created_items") or {}
		for name, count in pairs(population_start) do
			freeplayStartItems[name] = (freeplayStartItems[name] or 0) + count
		end
		remote.call("freeplay", "set_created_items", freeplayStartItems)
	end
	
	global.HousingList = { }
	global.FarmList = { }
	global.UpdateInterval = 0
	global.UpdateList = { }
	
	global.counter = 0
	global.queue = {}
	global.queue[60] = {toDo = doSomething}
end)

function on_new_entity(event)
	local new_entity = event.created_entity or event.entity --Handle multiple event types
	local surface = new_entity.surface
	local position = new_entity.position
	local force = new_entity.force
	if new_entity.name:find("-farm", 1, true) then	
		game.print("Found Farm")
		ManageFarmingBeacon(new_entity, surface, force, 3)
		if not CheckTableValue(new_entity,global.FarmList) then
			game.print("Farm inserted into Global Table")
			table.insert(global.FarmList, new_entity)
		end
	elseif new_entity.name == "fishery" then
		ManageFarmingBeacon(new_entity, surface, force, 3)
		if not CheckTableValue(new_entity,global.FarmList) then
			table.insert(global.FarmList, new_entity)
		end
	elseif new_entity.name == "sf-house" then
		ManageHousingBeacon(new_entity, surface, force, MathData.HousingSize[3])
		if not CheckTableValue(new_entity,global.HousingList) then
			table.insert(global.HousingList, new_entity)
		end
	elseif new_entity.name == "mf-house" then
		ManageHousingBeacon(new_entity, surface, force, MathData.HousingSize[3])
		if not CheckTableValue(new_entity,global.HousingList) then
			table.insert(global.HousingList, new_entity)
		end
	elseif new_entity.name == "low-rise" then
		ManageHousingBeacon(new_entity, surface, force, MathData.HousingSize[3])
		if not CheckTableValue(new_entity,global.HousingList) then
			table.insert(global.HousingList, new_entity)
		end
	elseif new_entity.name == "ap-tower" then
		ManageHousingBeacon(new_entity, surface, force, MathData.HousingSize[3])
		if not CheckTableValue(new_entity,global.HousingList) then
			table.insert(global.HousingList, new_entity)
		end
	elseif new_entity.name == "arcology-tower" then
		ManageHousingBeacon(new_entity, surface, force, MathData.HousingSize[3])
		if not CheckTableValue(new_entity,global.HousingList) then
			table.insert(global.HousingList, new_entity)
		end
	end
end

function on_remove_entity(event)
	local entity = event.created_entity or event.entity --Handle multiple event types
	if not entity then return end
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if entity.name == "sf-house" then
		removeHiddenBeacon(surface, position, Housing_Beacon)
	end
	if entity.name == "mf-house" then
		removeHiddenBeacon(surface, position, Housing_Beacon)
	end
	if entity.name == "low-rise" then
		removeHiddenBeacon(surface, position, Housing_Beacon)
	end
	if entity.name == "ap-tower" then
		removeHiddenBeacon(surface, position, Housing_Beacon)
	end
	if entity.name == "arcology-tower" then
		removeHiddenBeacon(surface, position, Housing_Beacon)
	end
end

function removeHiddenBeacon(surface, position, name)
	-- Remove Beacon for Housing
	if surface and surface.valid then
		for _, beacon in pairs(surface.find_entities_filtered{name = name, position = position}) do
			beacon.destroy()
		end
	end
end

--Separate functions to manage beacon modules
function ManageHousingBeaconModules(module_inventory, Score)
	if Score == (module_inventory.get_item_count(Housing_Pos_Module) - module_inventory.get_item_count(Housing_Neg_Module)) then
	else
		if module_inventory.get_item_count(Housing_Pos_Module) > 0 then
			module_inventory.remove{name = Housing_Pos_Module, count = module_inventory.get_item_count(Housing_Pos_Module)}
		elseif module_inventory.get_item_count(Housing_Neg_Module) > 0 then
			module_inventory.remove{name = Housing_Neg_Module, count = module_inventory.get_item_count(Housing_Neg_Module)}
		end
		local added_modules = round(math.abs(Score))
		if Score > 0 then
			module_inventory.insert{name = Housing_Pos_Module, count = added_modules}
		elseif Score < 0 then
			module_inventory.insert{name = Housing_Neg_Module, count = added_modules}
		end
	end
end
function ManageFarmingBeaconModules(module_inventory, Score)
	if Score == (module_inventory.get_item_count(Farming_Pos_Module) - module_inventory.get_item_count(Farming_Neg_Module)) then
		--game.print("Farm already has correct modules")
	else
		--game.print("Farm does not have correct modules")
		if module_inventory.get_item_count(Farming_Pos_Module) > 0 then
			--game.print("Farm already has Positive Modules")
			module_inventory.remove{name = Farming_Pos_Module, count = module_inventory.get_item_count(Farming_Pos_Module)}
		elseif module_inventory.get_item_count(Farming_Neg_Module) > 0 then
			--game.print("Farm already has Negative Modules")
			module_inventory.remove{name = Farming_Neg_Module, count = module_inventory.get_item_count(Farming_Neg_Module)}
		end
		local added_modules = round(math.abs(Score))
		game.print("Rounded Score:"..tostring(Score))
		if Score > 0 then
			module_inventory.insert{name = Farming_Pos_Module, count = added_modules}
		elseif Score < 0 then
			module_inventory.insert{name = Farming_Neg_Module, count = added_modules}
		end
	end
end

--Calculate Farming effectivity
function CalculateFarmingBeacon(entity, surface, position, force, radius)
	local Score = 0
	local WaterTiles = 0
	local GoodTiles = 0
	local BadTiles = 0
	--Check what the tiles its on are
	if entity.name == "fishery" then
		for i, tile in pairs(surface.find_tiles_filtered{position = position,radius = radius}) do
			if stdlib.contains(tile.name, "water") and not stdlib.contains(tile.name, "green") then
				GoodTiles = GoodTiles + 1
			elseif stdlib.contains(tile.name, "water") and stdlib.contains(tile.name, "green") then
				GoodTiles = GoodTiles + 0.5
			end
		end
	else
		for i, tile in pairs(surface.find_tiles_filtered{position = position,radius = radius}) do
			--game.print(serpent.block(tile.name))
			if CheckTableValue(tile.name,global.Meh_Tiles_List) then
				BadTiles = BadTiles + 2
			elseif CheckTableValue(tile.name,global.Bad_Tiles_List) then
				BadTiles = BadTiles + 3
			elseif CheckTableValue(tile.name,global.Good_Tiles_List) then
				GoodTiles = GoodTiles + 1
			end
		end
	end
	--game.print("Good Tile Count: "..tostring(GoodTiles))
	--game.print("Bad Tile Count: "..tostring(BadTiles))
	Score = Score + GoodTiles
	Score = Score - BadTiles
	
	--Account for pollution
	Score = Score - surface.get_pollution(position)
	
	--Check for nearby water. Polluted water is still pretty good
	if entity.name == "fishery" then
		for i, tile in pairs(surface.find_tiles_filtered{position = position,radius = 2*radius}) do
			if stdlib.contains(tile.name, "water") and not stdlib.contains(tile.name, "green") then
				WaterTiles = WaterTiles + 0.25
			elseif stdlib.contains(tile.name, "water") and stdlib.contains(tile.name, "green") then
				WaterTiles = WaterTiles + 0.125
			end
		end
	else
		for i, tile in pairs(surface.find_tiles_filtered{position = position,radius = 2*radius}) do
			if stdlib.contains(tile.name, "water") and not stdlib.contains(tile.name, "green") then
				WaterTiles = WaterTiles + 4
			elseif stdlib.contains(tile.name, "water") and stdlib.contains(tile.name, "green") then
				WaterTiles = WaterTiles + 2
			end
		end
	end
	--game.print("Water Tile Effect: "..tostring(WaterTiles))
	--game.print("Score:"..tostring(Score))
	Score = Score + WaterTiles
	return Score
end

--Calculate terrain impact
function CalculateHousingBeacon(surface, position, force, radius)
	local Tiles_Max = radius*radius/5 --You need this many Meh tiles to start having penalties, then you can have this many Meh tiles give penalties, and this is the max number of a single type of good or bad tile that have an effect
	local Score = 0
	local TempScore = 0
	local Terrain_Radius = 2*radius
	--game.print("Max Tiles: "..tostring(Tiles_Max))
	
	
	--Count trees
	for _, entity in pairs(surface.find_entities_filtered{area = areaAroundPosition(position, Terrain_Radius)}) do
		--game.print(serpent.block(entity.name))
		if stdlib.contains(entity.name, "tree") then
			--game.print("Found Tree")
			if not stdlib.contains(entity.name, "dead") then
				--game.print("Found Living Tree")
				TempScore = TempScore + Per_Tree_Impact
			end
		end
	end
	Score = Score + TempScore
	--game.print("Tree Impact: "..tostring(TempScore))
	--game.print("Total Score: "..tostring(Score))
	TempScore = 0
	for _, entity in pairs(surface.find_entities_filtered{area = areaAroundPosition(position, Terrain_Radius)}) do
		if stdlib.contains(entity.name, "tree") and stdlib.contains(entity.name, "dead") then
			--game.print("Found Dead Tree")
			TempScore = TempScore + Per_Tree_Impact
		end
	end
	Score = Score - TempScore
	--game.print("Negative Tree Impact: "..tostring(TempScore))
	--game.print("After Trees Score: "..tostring(Score))
	TempScore = 0
	
	--Count Terrain
	local WaterTiles = 0
	local GoodTiles = 0
	local BadTiles = 0
	local MehTiles = 0
	for i, tile in pairs(surface.find_tiles_filtered{position = position,radius = Terrain_Radius}) do
		--game.print(serpent.block(tile.name))
		local Building = surface.find_entities_filtered{position = tile.position}
		Building = Building[1]
		if Building then
			if Building.name:find("farm", 1, true) then
				GoodTiles = GoodTiles + 1
			else
				if CheckTableValue(Building.type, global.Bad_Building_List) then
					MehTiles = MehTiles + 1
				end
			end
		elseif CheckTableValue(tile.name,global.Meh_Tiles_List) or Building then
			MehTiles = MehTiles + 1
		elseif CheckTableValue(tile.name,global.Bad_Tiles_List) then
			BadTiles = BadTiles + 1
		elseif CheckTableValue(tile.name,global.Good_Tiles_List) then
			GoodTiles = GoodTiles + 1
		elseif CheckTableValue(tile.name,global.Good_Water_Tiles_List) then
			GoodTiles = GoodTiles + 1
		end
	end
	--game.print("Good Tile Count: "..tostring(GoodTiles))
	--game.print("Bad Tile Count: "..tostring(BadTiles))
	--game.print("Meh Tile Count: "..tostring(MehTiles))
	
	
	if MehTiles > Tiles_Max then
		BadTiles = BadTiles + MehTiles - Tiles_Max
	end
	TempScore = GoodTiles - BadTiles
	--game.print("Tile Temp Score: "..tostring(TempScore))
	if TempScore > 0 and TempScore > Tiles_Max then
		Score = Score + Tiles_Max*Per_Tile_Impact
	else
		Score = Score + TempScore*Per_Tile_Impact
	end
	if TempScore < 0 then
		if TempScore < (Tiles_Max*-1) then
			Score = Score - Tiles_Max*Per_Tile_Impact
		else
			Score = Score - TempScore*Per_Tile_Impact
		end
	end
	--game.print("After Tiles Score: "..tostring(Score))
	--Account for pollution
	local pollution = surface.get_pollution(position)
	--game.print("Pollution: "..tostring(pollution))
	Score = Score - pollution
	if Score > Tiles_Max then
		return Tiles_Max
	elseif	Score < (Tiles_Max*-1) then
		return (Tiles_Max*-1)
	else
		return Score
	end
end

-- Set modules in hidden beacons for Terrain speed bonus
function ManageHousingBeacon(entity, surface, force, radius)
	--game.print("Updating house at"..serpent.line(entity.position))
	local hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
	--game.print("Beacon "..serpent.block(hiddenBeacon))
	if hiddenBeacon == nil then
		--Make beacon
		--log("Make a Beacon")
		surface.create_entity{name = Housing_Beacon, position = entity.position, raise_built = false}
		hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
	end
	--game.print("Beacon "..serpent.block(hiddenBeacon))
	--Fill beacon
	if hiddenBeacon then
		--game.print("Beacon is valid")
		--log("Beacon "..serpent.block(hiddenBeacon))
		local module_inventory = hiddenBeacon.get_module_inventory()
		if module_inventory then
			--game.print("Module Inventory is valid")
			local Score = CalculateHousingBeacon(surface, hiddenBeacon.position, force, radius)
			--game.print("Final House Score: "..tostring(Score))
			ManageHousingBeaconModules(module_inventory, Score)
		end
	end
end
-- Set modules in hidden beacons for Terrain farming speed bonus
function ManageFarmingBeacon(entity, surface, force, radius)
	game.print("Updating farm at"..serpent.line(entity.position))
	if entity.valid then
		log(entity.name.." is valid")
		local hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
		--game.print("Beacon "..serpent.block(hiddenBeacon))
		if hiddenBeacon == nil then
			--Make beacon
			--game.print("Make a Beacon")
			surface.create_entity{name = Housing_Beacon, position = entity.position, raise_built = false}
			hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
		end
		--game.print("Verify Beacon "..serpent.block(hiddenBeacon))
		--Fill beacon
		if hiddenBeacon then
			--game.print("Beacon is valid")
			--log("Beacon "..serpent.block(hiddenBeacon))
			local module_inventory = hiddenBeacon.get_module_inventory()
			--game.print("Beacon Modules "..serpent.block(module_inventory))
			if module_inventory then
				game.print("Module Inventory is valid")
				local Score = CalculateFarmingBeacon(entity, surface, entity.position, force, radius)
				game.print("Final Farm Score: "..tostring(Score))
				ManageFarmingBeaconModules(module_inventory, Score)
			end
		end
	end
end


script.on_event(defines.events.on_entity_destroyed, on_remove_entity)
script.on_event(defines.events.on_built_entity, on_new_entity)
script.on_event(defines.events.on_robot_built_entity, on_new_entity)
script.on_event(defines.events.script_raised_built, on_new_entity)
script.on_event(defines.events.script_raised_revive, on_new_entity)