--Modules
local stdlib = require('__stdlib__/stdlib/utils/string')
local MathData = require("prototypes/Data Script")
--My entities
local Housing_Beacon = "housing-beacon"
local Housing_Pos_Module = "housing-positive-speed-module"
local Housing_Neg_Module = "housing-negative-speed-module"
local Housing_Beaconed_Entities = {"sf-house", "mf-house", "low-rise", "ap-tower", "arcology-tower"}

local Per_Tile_Impact = 1
--Living Trees are good. Dead Trees bad.
local Per_Tree_Impact = 1

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

--on_nth_tick(108000, handler) --Recheck all housing structures every so often, at 30 minutes right now.
--(event.tick % global.intervalBetweenNodeUpdates == 0) --Divides the current tick count of the game, and checks if the remainder is zero


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
		["mf-house"] = 5,
		["wood"] = 100,
		["vegetables-farm"] = 2,
		["grain-farm"] = 2,
	}
	if remote.interfaces["freeplay"] then
		local freeplayStartItems = remote.call("freeplay", "get_created_items") or {}
		for name, count in pairs(population_start) do
			freeplayStartItems[name] = (freeplayStartItems[name] or 0) + count
		end
		remote.call("freeplay", "set_created_items", freeplayStartItems)
	end
end)

function on_new_entity(event)
	local new_entity = event.created_entity or event.entity --Handle multiple event types
	local surface = new_entity.surface
	local position = new_entity.position
	local force = new_entity.force
	if stdlib.contains(new_entity.name, "-farm") then
		ManageFarmingBeacon(new_entity, surface, position, force, 3)
	elseif new_entity.name == "sf-house" then
		ManageHousingBeacon(surface, position, force, MathData.HousingSize[3])
	elseif new_entity.name == "mf-house" then
		ManageHousingBeacon(surface, position, force, MathData.HousingSize[3])
	elseif new_entity.name == "low-rise" then
		ManageHousingBeacon(surface, position, force, MathData.HousingSize[3])
	elseif new_entity.name == "ap-tower" then
		ManageHousingBeacon(surface, position, force, MathData.HousingSize[3])
	elseif new_entity.name == "arcology-tower" then
		ManageHousingBeacon(surface, position, force, MathData.HousingSize[3])
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

--Separate function to manage beacon modules, since multiple things use it
function ManageBeaconModules(module_inventory, Score)
	if Score == (module_inventory.get_item_count(Housing_Pos_Module) - module_inventory.get_item_count(Housing_Neg_Module)) then
	else
		if module_inventory.get_item_count(Housing_Pos_Module) > 0 then
			module_inventory.remove{name = Housing_Pos_Module, count = module_inventory.get_item_count(Housing_Pos_Module)}
		elseif module_inventory.get_item_count(Housing_Neg_Module) > 0 then
			module_inventory.remove{name = Housing_Neg_Module, count = module_inventory.get_item_count(Housing_Neg_Module)}
		end
		local added_modules = math.abs(Score)
		if Score > 0 then
			module_inventory.insert{name = Housing_Pos_Module, count = added_modules}
		elseif Score < 0 then
			module_inventory.insert{name = Housing_Neg_Module, count = added_modules}
		end
	end
end

--Calculate Farming effectivity
function CalculateFarmingBeacon(surface, position, force, radius)
	local Score = 0
	local WaterTiles = 0
	local GoodTiles = 0
	local BadTiles = 0
	--Check what the tiles its on are
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
	--game.print("Good Tile Count: "..tostring(GoodTiles))
	--game.print("Bad Tile Count: "..tostring(BadTiles))

	Score = Score + GoodTiles
	Score = Score - BadTiles
	
	--Check for nearby water. Polluted water is still pretty good
	for i, tile in pairs(surface.find_tiles_filtered{position = position,radius = 2*radius}) do
		if stdlib.contains(tile.name, "water") and not stdlib.contains(tile.name, "green") then
			WaterTiles = WaterTiles + 4
		elseif stdlib.contains(tile.name, "water") and stdlib.contains(tile.name, "green") then
			WaterTiles = WaterTiles + 2
		end
	end
	--game.print("Water Tile Effect: "..tostring(WaterTiles))
	Score = Score + WaterTiles
	return Score
end

--Calculate terrain impact
function CalculateHousingBeacon(surface, position, force, radius)
	local Tiles_Max = radius*radius/10 --You need this many Meh tiles to start having penalties, then you can have this many Meh tiles give penalties, and this is the max number of a single type of good or bad tile that have an effect
	local Score = 0
	local TempScore = 0
	local Terrain_Radius = 2*radius
	--game.print("Per Tree Impact: "..tostring(Per_Tree_Impact))
	--game.print("Per Tile Impact: "..tostring(Per_Tile_Impact))
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
	--game.print("Total Score: "..tostring(Score))
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
			if CheckTableValue(Building.type, global.Bad_Building_List) then
				MehTiles = MehTiles + 1
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
	
	if GoodTiles > Tiles_Max then
		Score = Score + Tiles_Max*Per_Tile_Impact
	else
		Score = Score + GoodTiles*Per_Tile_Impact
	end
	if BadTiles > Tiles_Max then
		Score = Score - Tiles_Max*Per_Tile_Impact
	else
		Score = Score - BadTiles*Per_Tile_Impact
	end
	if MehTiles > 0 then
		if (MehTiles - Tiles_Max) > Tiles_Max then
			Score = Score - Tiles_Max*Per_Tile_Impact
		else
			Score = Score - ((MehTiles - Tiles_Max)*Per_Tile_Impact)
		end
	end
	return Score
end

-- Set modules in hidden beacons for Terrain speed bonus
function ManageHousingBeacon(surface, position, force, radius)
	for _, entity in pairs(surface.find_entities_filtered{name = Housing_Beaconed_Entities, force = force, area = areaAroundPosition(position, radius)}) do
		if entity.valid then
			--log(entity.name.." is valid")
			local hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
			--log("Beacon "..serpent.block(hiddenBeacon))
			if hiddenBeacon == nil then
				--Make beacon
				--log("Make a Beacon")
				surface.create_entity{name = Housing_Beacon, position = entity.position, raise_built = false}
				hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
			end
			--log("Beacon "..serpent.block(hiddenBeacon))
			--Fill beacon
			if hiddenBeacon then
				--log("Beacon is valid")
				--log("Beacon "..serpent.block(hiddenBeacon))
				local module_inventory = hiddenBeacon.get_module_inventory()
				if module_inventory then
					local Score = CalculateHousingBeacon(surface, hiddenBeacon.position, force, radius)
					--game.print("Final Score: "..tostring(Score))
					ManageBeaconModules(module_inventory, Score)
				end
			end
		end
	end
end
-- Set modules in hidden beacons for Terrain farming speed bonus
function ManageFarmingBeacon(entity, surface, position, force, radius)
	if entity.valid then
		--log(entity.name.." is valid")
		local hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
		--log("Beacon "..serpent.block(hiddenBeacon))
		if hiddenBeacon == nil then
			--Make beacon
			--log("Make a Beacon")
			surface.create_entity{name = Housing_Beacon, position = entity.position, raise_built = false}
			hiddenBeacon = surface.find_entity(Housing_Beacon, entity.position)
		end
		--log("Beacon "..serpent.block(hiddenBeacon))
		--Fill beacon
		if hiddenBeacon then
			--log("Beacon is valid")
			--log("Beacon "..serpent.block(hiddenBeacon))
			local module_inventory = hiddenBeacon.get_module_inventory()
			if module_inventory then
				local Score = CalculateFarmingBeacon(surface, hiddenBeacon.position, force, radius)
				--game.print("Final Score: "..tostring(Score))
				ManageBeaconModules(module_inventory, Score)
			end
		end
	end
end

script.on_event(defines.events.on_entity_destroyed, on_remove_entity)
script.on_event(defines.events.on_built_entity, on_new_entity)
script.on_event(defines.events.on_robot_built_entity, on_new_entity)
script.on_event(defines.events.script_raised_built, on_new_entity)
script.on_event(defines.events.script_raised_revive, on_new_entity)