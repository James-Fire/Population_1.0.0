local energy_required = 40
local amount_param = 1
sciencepacks = {}
sciencepackrecipes = {}
--Get all the science packs
for i, prototype in pairs(data.raw.item) do
	if string.find(prototype.name, "science") then
		table.insert(sciencepacks, prototype)
	end
end


--Get all the science pack recipes
for i, prototype in pairs(data.raw.recipe) do
	if string.find(prototype.name, "science") and prototype.category == nil then
		table.insert(sciencepackrecipes, prototype)
	end
end
--[[Make a Data Card for each science pack
for i, SciencePack in pairs(sciencepacks) do
	LSlib.item.duplicate("item", SciencePack, SciencePack.."-data")
end]]
for i, Science in pairs(sciencepackrecipes) do
	--Add people to each science pack recipe, based on an exponent of how many packs it makes per recipe
	LSlib.recipe.addIngredient(Science.name, "person", 2*LSlib.recipe.getResultCount(Science.name, Science.name)*LSlib.recipe.getResultCount(Science.name, Science.name), "item")
	LSlib.recipe.addResult(Science.name, "tired-person", 2*LSlib.recipe.getResultCount(Science.name, Science.name)*LSlib.recipe.getResultCount(Science.name, Science.name), "item")
	LSlib.recipe.setMainResult(Science.name, Science.name)
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

local rocketrecipes = { }
local Items = { "item", "fluid", "module", "tool", "ammo", "capsule", "armor", "gun", "rail-planner", "repair-tool", "item-with-entity-data", "spidertron-remote" }
for i, ItemType in pairs(Items) do
	for j, Item in pairs(data.raw[ItemType]) do
		if Item.rocket_launch_product and Item.name ~= "space-science-pack" then
			for k, Recipe in pairs(FindItemRecipe(Item.name)) do
				if Recipe.name:find("replication", 1, true) or Recipe.name:find("request", 1, true) then
				else
					table.insert(rocketrecipes,Recipe.name)
				end
			end
			for k, Recipe in pairs(FindItemRecipe(Item.rocket_launch_product)) do
				if Recipe.name:find("replication", 1, true) or Recipe.name:find("request", 1, true) then
				elseif CheckTableValue(Recipe.name,rocketrecipes) == false then
					table.insert(rocketrecipes,Recipe.name)
				end
			end
		end
	end
end

for i, rocket in pairs(rocketrecipes) do
	local recipe = data.raw.recipe[rocket] 
	--Add people to any rocket launch items, based on how many items it takes, times the average item count.
	local recipe_data = recipe
	if recipe.normal then
		recipe_data = recipe.normal
	else
		recipe_data = recipe
	end
	log(recipe.name)
	if recipe_data.ingredients[1] then
		log(recipe.name..": "..serpent.block(recipe_data.ingredients))
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
			end
		end
		TotalIngredCount = TotalIngredCount/TotalIngreds
		log(recipe.name.." People: "..tostring(TotalResultCount))
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
		log(recipe.name.." People: "..tostring(TotalResultCount))
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