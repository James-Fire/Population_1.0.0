local energy_required = 40
local amount_param = 1
local sciencepacks = {}
local sciencepackrecipes = {}
local rocketrecipes = { }
local packorfluid = "pack"
local toolorfluid = tool

local function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.ceil(num * mult + 0.5) / mult
end

if (mods["MoreScience"]) then
	packorfluid = "fluid"
	table.insert(sciencepackrecipes, data.raw.recipe["automation-science-pack-basic"])
end
--Get all the science packs
for i, prototype in pairs(data.raw.tool) do
	if prototype.name:find("science", 1, true) then
		table.insert(sciencepacks, prototype)
	end
end

--Get all the science pack recipes
for i, prototype in pairs(data.raw.recipe) do
	if prototype.name:find("science", 1, true) and prototype.name:find(packorfluid, 1, true) then
		if not prototype.name:find("barrel", 1, true) then
			table.insert(sciencepackrecipes, prototype)
		end
	elseif (mods["MoreScience"]) and prototype.name:find("rocketpart", 1, true) then
		table.insert(rocketrecipes, prototype.name)
	elseif (mods["MoreScience"]) and prototype.name:find("infused", 1, true) then
		table.insert(sciencepackrecipes, prototype)
	end
end

--log(serpent.block(sciencepackrecipes))
--[[Make a Data Card for each science pack
for i, SciencePack in pairs(sciencepacks) do
	LSlib.item.duplicate("item", SciencePack, SciencePack.."-data")
end]]
for i, Science in pairs(sciencepackrecipes) do
	--Add people to each science pack recipe, based on an exponent of how many packs it makes per recipe
	local PeopleCount = 0
	if (mods["MoreScience"]) then
		PeopleCount = Science.energy_required*LSlib.recipe.getResultCount(Science.name)*(LSlib.recipe.getIngredientsCount(Science.name, true)[1]+LSlib.recipe.getIngredientsCount(Science.name, true)[2]-1)/2
	else
		PeopleCount = 2*LSlib.recipe.getResultCount(Science.name, Science.name)*LSlib.recipe.getResultCount(Science.name, Science.name)
	end
	if PeopleCount < #Science.ingredients then
		PeopleCount = #Science.ingredients
	end
	if Science.name:find("fluid", 1, true) then
		PeopleCount = PeopleCount/100
	end
	if PeopleCount <= 1 then
		PeopleCount = 2
	end
	if data.raw.tool[Science.name] then
		LSlib.recipe.setMainResult(Science.name, Science.name)
	elseif data.raw.fluid[Science.name] then
		LSlib.recipe.setMainResult(Science.name, Science.name)
	elseif Science.result then
		Science.main_product = Science.result
	end
	--Why is it so fucking hard to just set a fucking icon
	if (not Science.icon) and Science.result then
		if data.raw.tool[Science.result] then
			if data.raw.tool[Science.result].icon then
				Science.icon = data.raw.tool[Science.result].icon
			elseif data.raw.tool[Science.result].icons then
				Science.icons = data.raw.tool[Science.result].icons
			end
		elseif data.raw.fluid[Science.result] then
			if data.raw.fluid[Science.result].icon then
				Science.icon = data.raw.fluid[Science.result].icon
			elseif data.raw.fluid[Science.result].icons then
				Science.icons = data.raw.fluid[Science.result].icons
			end
		end
	elseif (not Science.icon) and Science.results then
		ScienceResult = Science.results[1]
		if data.raw.tool[ScienceResult] then
			if data.raw.tool[ScienceResult].icon then
				Science.icon = data.raw.tool[ScienceResult].icon
			elseif data.raw.tool[ScienceResult].icons then
				Science.icons = data.raw.tool[ScienceResult].icons
			end
		elseif data.raw.fluid[ScienceResult] then
			if data.raw.fluid[ScienceResult].icon then
				Science.icon = data.raw.fluid[ScienceResult].icon
			elseif data.raw.fluid[ScienceResult].icons then
				Science.icons = data.raw.fluid[ScienceResult].icons
			end
		end
	end
	--Why does More Science have so much bullshit to deal with just to add a result to their recipes?
	if (mods["MoreScience"]) and Science.name:find("infused", 1, true) then
		Science.subgroup = "ms-science-science-cauldron"
	end
	
	LSlib.recipe.addIngredient(Science.name, "person", PeopleCount, "item")
	LSlib.recipe.addResult(Science.name, "tired-person", PeopleCount, "item")
	for km, vm in pairs(data.raw.module) do
		if vm.effect.productivity and vm.limitation then
			for n, Name in pairs(vm.limitation) do
				if Name == Science.name then
					table.remove(vm.limitation, n)
				end
			end
		end
	end
end

--Find all things that have a rocket launch product, then find the recipes that make them.
local function CheckTableValue(Value,Table,SubTableIndex)
	for i, v in pairs(Table) do
		if type(v) == "table" then
			if Value == v[SubTableIndex] then
				return true
			end
		else
			if Value == v then
				return true
			end
		end
	end
	return false
end
local function FindItemRecipe(Item)
	local RecipeTable = { }
	if data.raw.recipe[Item] then
		if CheckTableValue(data.raw.recipe[Item],RecipeTable) == false then
			table.insert(RecipeTable,data.raw.recipe[Item])
		end
	end
	for i, recipe in pairs(data.raw.recipe) do
		if CheckTableValue(recipe,RecipeTable) == false then
			if recipe.main_product == Item then
					table.insert(RecipeTable,recipe)
			elseif recipe.main_product == nil then
				if recipe.results then
					for i, result_data in pairs(recipe.results) do
						if (result_data.name or result_data[1]) == Item then
							table.insert(RecipeTable,recipe)
						end
					end
				elseif recipe.result then
					if recipe.result == Item then
						table.insert(RecipeTable,recipe)
					end
				end
			end
		end
	end
	for i, r1 in pairs(RecipeTable) do
		for j, r2 in pairs(RecipeTable) do
			if i == j then
			else
				if r1 == r2 then
					RecipeTable[j] = nil
				end
			end
		end
	end
	return RecipeTable
end

local Items = { "item", "fluid", "module", "tool", "ammo", "capsule", "armor", "gun", "rail-planner", "repair-tool", "item-with-entity-data", "spidertron-remote" }
for i, ItemType in pairs(Items) do
	for j, Item in pairs(data.raw[ItemType]) do
		if Item.rocket_launch_product and Item.name ~= "space-science-pack" then
			for k, Recipe in pairs(FindItemRecipe(Item.name)) do
				if Recipe.name:find("replication", 1, true) or Recipe.name:find("request-", 1, true) then
				else
					table.insert(rocketrecipes,Recipe.name)
				end
			end
			for k, Recipe in pairs(FindItemRecipe(Item.rocket_launch_product)) do
				if Recipe.name:find("replication", 1, true) or Recipe.name:find("request-", 1, true) then
				elseif CheckTableValue(Recipe.name,rocketrecipes) == false then
					table.insert(rocketrecipes,Recipe.name)
				end
			end
		end
	end
end

for i, rocket in pairs(rocketrecipes) do
	local recipe = data.raw.recipe[rocket] 
	--Add people to any rocket launch items, based on how many items it takes, times the average item count, times the time required divided by 30.
	local recipe_data = recipe
	if recipe.normal then
		recipe_data = recipe.normal
	else
		recipe_data = recipe
	end
	--log(recipe.name)
	if recipe_data.ingredients[1] then
		--log(recipe.name..": "..serpent.block(recipe_data.ingredients))
		local TotalIngreds = 0
		local TotalIngredCount = 0
		for i, ingredient in pairs(recipe_data.ingredients) do
			if ingredient.type ~= "fluid" then
				TotalIngreds = TotalIngreds + 1
				local ingredientcount = 1
				if ingredient.count then
					ingredientcount = ingredient.count
				elseif ingredient.amount then
					ingredientcount = ingredient.amount
				else
					ingredientcount = ingredient[2]
				end
				TotalIngredCount = TotalIngredCount + ingredientcount
			else
				TotalIngreds = TotalIngreds + 1
				local ingredientcount = 1
				if ingredient.count then
					ingredientcount = ingredient.count
				elseif ingredient.amount then
					ingredientcount = ingredient.amount
				else
					ingredientcount = ingredient[2]
				end
				TotalIngredCount = TotalIngredCount + ingredientcount/100
			end
		end
		TotalIngredCount = TotalIngredCount/TotalIngreds
		if TotalIngredCount < #recipe_data.ingredients then
			TotalIngredCount = #recipe_data.ingredients
		end
		TotalIngredCount = TotalIngredCount*(math.log(recipe.energy_required) / math.log(10))/3
		
		if TotalIngredCount > 65535 then
			TotalIngredCount = 65535
		end
		--log(recipe.name.." People: "..tostring(TotalResultCount))
		LSlib.recipe.addResult(recipe.name, "tired-person", math.max(TotalIngredCount,1), "item")
		LSlib.recipe.addIngredient(recipe.name, "person", math.max(TotalIngredCount,1), "item")
		LSlib.recipe.setMainResult(recipe.name, recipe.name)
		for km, vm in pairs(data.raw.module) do
			if vm.effect.productivity and vm.limitation then
				for n, Name in pairs(vm.limitation) do
					if Name == recipe.name then
						table.remove(vm.limitation, n)
					end
				end
			end
		end
	else
		local TotalResults = 0
		local TotalResultCount = 1
		if recipe_data.results then
			for i, result in pairs(recipe_data.results) do
				TotalResults = TotalResults + 1
				if result.count then
					TotalResultCount = TotalResultCount + result.count
				elseif result.amount then
					TotalResultCount = TotalResultCount + result.amount
				end
			end
		elseif recipe_data.result then
			TotalResults = TotalResults + 1
			if recipe_data.result.count then
				TotalResultCount = recipe_data.result.count
			end
		end
		TotalResultCount = TotalResultCount/TotalResults
		--log(recipe.name.." People: "..tostring(TotalResultCount))
		LSlib.recipe.addResult(recipe.name, "tired-person", math.max(TotalResultCount,1), "item")
		LSlib.recipe.addIngredient(recipe.name, "person", math.max(TotalResultCount,1), "item")
		LSlib.recipe.setMainResult(recipe.name, recipe.name)
		for km, vm in pairs(data.raw.module) do
			if vm.effect.productivity and vm.limitation then
				for n, Name in pairs(vm.limitation) do
					if Name == recipe.name then
						table.remove(vm.limitation, n)
					end
				end
			end
		end
	
	end
end