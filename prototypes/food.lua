local stdlib = require('__stdlib__/stdlib/utils/string')

data:extend({
	--Food Packaging should be of prepared meals
	--Food can be 2 to 5 ingredients
	
	--Base Food items. Meals are manufactured, then packaged separately
	{
		type = "item",
		name = "food-2",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 20
	},
	{
		type = "item",
		name = "food-3",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 20
	},
	{
		type = "item",
		name = "food-4",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 20
	},
	{
		type = "item",
		name = "food-5",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 20
	},
	
	--Plastic Packaging
	{
		type = "recipe",
		name = "plastic-food-2",
		category = "crafting",
		enabled = false,
		energy_required = 1,
		ingredients = {
			{ "plastic-bar",2 },
			{ "food-2",1 },
		},
		result = "plastic-food-2",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "plastic-Food",
		order = "a",
	},
	{
		type = "recipe",
		name = "food-2",
		category = "crafting",
		enabled = true,
		energy_required = 10,
		ingredients = {
		},
		result = "food-2",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "food-manufacture-2",
		order = "a",
	},
	
})
--[[local DebugTable = { }


local function CheckTableValue(Value,Table)
	for i, v in pairs(Table) do
		if Value == v then
			return true
		end
	end
	return false
end

--Generate recipes to make every combination of ingredients to make food
for i, Item1 in pairs(FoodItems) do
	--local Size = table_size(FoodItems)
	for j, Item2 in pairs(FoodItems) do
		if CheckTableValue(Item1,{Item2}) == false then
			make_recipes({Item1,Item2})
		else end
		for k, Item3 in pairs(FoodItems) do
			if CheckTableValue(Item1,{Item2,Item3}) == false and CheckTableValue(Item2,{Item3}) == false then
				make_recipes({Item1,Item2,Item3})
			else end
			for l, Item4 in pairs(FoodItems) do
				if CheckTableValue(Item1,{Item2,Item3,Item4}) == false and CheckTableValue(Item2,{Item3,Item4}) == false and CheckTableValue(Item3,{Item4}) == false then
					make_recipes({Item1,Item2,Item3,Item4})
				else end
				for m, Item5 in pairs(FoodItems) do
					if CheckTableValue(Item1,{Item2,Item3,Item4,Item5}) == false and CheckTableValue(Item2,{Item3,Item4,Item5}) == false and CheckTableValue(Item3,{Item4,Item5}) == false and CheckTableValue(Item4,{Item5}) == false then
						make_recipes({Item1,Item2,Item3,Item4,Item5})
					else end
				end
			end
		end
	end
end
log(serpent.block(DebugTable))]]

local FoodItems = {"grain","fruit","vegetables","meat", "raw-fish", "hemp-food", "nuts"}

--Actually calculates the combinations.
local function comb_aux(m, n, results, from)
    if m == 0 or m == n then
        local t = {}
        for i = 1, m do t[i] = i end
        results[from] = t
        return 1
    end
    local filled = comb_aux(m - 1, n - 1, results, from)
    for i = from, from + filled - 1 do
        table.insert(results[i], n)
    end
    filled = filled + comb_aux(m, n - 1, results, from + filled)
    return filled
end

local function combinations(m, n)
    local results = {}
    comb_aux(m, n, results, 1)
    return results
end


local function make_recipes(IngredientTable)
	local Size = table_size(IngredientTable)
	local recipe = nil
	--Determine how many items are being used, name the recipe accordingly
	if Size == 2 then
		LSlib.recipe.duplicate("food-2", IngredientTable[1]..IngredientTable[2].."-food-"..Size)
		recipe = IngredientTable[1]..IngredientTable[2].."-food-"..Size
		LSlib.item.setSubgroup("recipe", recipe, "food-manufacture-"..Size)
	end
	if Size == 3 then
		LSlib.recipe.duplicate("food-2", IngredientTable[1]..IngredientTable[2]..IngredientTable[3].."-food-"..Size)
		recipe = IngredientTable[1]..IngredientTable[2]..IngredientTable[3].."-food-"..Size
		LSlib.recipe.editResult(recipe, "food-2", "food-3", 1 )
		LSlib.item.setSubgroup("recipe", recipe, "food-manufacture-"..Size)
	end
	if Size == 4 then
		LSlib.recipe.duplicate("food-2", IngredientTable[1]..IngredientTable[2]..IngredientTable[3]..IngredientTable[4].."-food-"..Size)
		recipe = IngredientTable[1]..IngredientTable[2]..IngredientTable[3]..IngredientTable[4].."-food-"..Size
		LSlib.recipe.editResult(recipe, "food-2", "food-4", 1 )
		LSlib.item.setSubgroup("recipe", recipe, "food-manufacture-"..Size)
	end
	if Size == 5 then
		LSlib.recipe.duplicate("food-2", IngredientTable[1]..IngredientTable[2]..IngredientTable[3]..IngredientTable[4]..IngredientTable[5].."-food-"..Size)
		recipe = IngredientTable[1]..IngredientTable[2]..IngredientTable[3]..IngredientTable[4]..IngredientTable[5].."-food-"..Size
		LSlib.recipe.editResult(recipe, "food-2", "food-5", 1 )
		LSlib.item.setSubgroup("recipe", recipe, "food-manufacture-"..Size)
	end
	--Iterate through the ingredient list and add them all to the recipe.
	for i, Item in pairs(IngredientTable) do
		LSlib.recipe.addIngredient(recipe, IngredientTable[i], 1 )
	end
end

--Function to call gateway, turn the output into ingredient string tables, then apply those tables to make recipes.
for i, v in pairs({2,3,4,5}) do
	local results = combinations(v,table_size(FoodItems))
	for j, ResultTable in pairs(results) do
		local FoodTable = { }
		for k, ResultNumber in pairs(ResultTable) do
			table.insert(FoodTable, FoodItems[ResultNumber])
		end
		make_recipes(FoodTable)
	end
end

LSlib.recipe.disable("food-2")

local MaterialTypes = {"plastic","copper","paper"}
local FoodTiers = {"food-2","food-3","food-4","food-5"}
--[[if Aluminum exists do
	table.insert(MaterialTypes, "aluminum")
end]]

for _, count in pairs(FoodTiers) do
	for _, Type in pairs(MaterialTypes) do
		LSlib.item.duplicate("item", count, Type.."-"..count)
		LSlib.item.setSubgroup("item", Type.."-"..count, Type.."-Food")
	end
end

LSlib.recipe.duplicate("plastic-food-2", "copper-food-2")
LSlib.recipe.duplicate("plastic-food-2", "paper-food-2")
LSlib.recipe.enable("copper-food-2")
LSlib.recipe.enable("paper-food-2")
LSlib.recipe.setSubgroup("copper-food-2","copper-Food")
LSlib.recipe.setSubgroup("paper-food-2","paper-Food")

LSlib.technology.addRecipeUnlock("plastics", "plastic-food-2")

LSlib.recipe.editIngredient("copper-food-2", "plastic-bar", "copper-plate", 1 )
LSlib.recipe.editIngredient("paper-food-2", "plastic-bar", "paper", 1 )
LSlib.recipe.editResult("copper-food-2", "plastic-food-2", "copper-food-2", 1 )
LSlib.recipe.editResult("paper-food-2", "plastic-food-2", "paper-food-2", 1 )

local PackageTiers = {"plastic-food-2","copper-food-2","paper-food-2"}


for _, recipe in pairs(PackageTiers) do
	for i, count in pairs({"3","4","5"}) do
		--Plastic Packaging
		if stdlib.contains(recipe, "plastic") then
			LSlib.recipe.duplicate("plastic-food-2", "plastic-food-"..count)
			LSlib.recipe.editIngredient("plastic-food-"..count, "food-2", "food-"..count, 1 )
			LSlib.recipe.editIngredient("plastic-food-"..count, "plastic-bar", "plastic-bar", i/2+1 )
			LSlib.recipe.editResult("plastic-food-"..count, "plastic-food-2", "plastic-food-"..count, 1 )
			LSlib.technology.addRecipeUnlock("plastics", "plastic-food-"..count)
		end
		--Copper Packaging
		if stdlib.contains(recipe, "copper") then
			LSlib.recipe.duplicate("copper-food-2", "copper-food-"..count)
			LSlib.recipe.editIngredient("copper-food-"..count, "food-2", "food-"..count, 1 )
			LSlib.recipe.editIngredient("copper-food-"..count, "copper-plate", "copper-plate", i/2+1 )
			LSlib.recipe.editResult("copper-food-"..count, "copper-food-2", "copper-food-"..count, 1 )
		end
		--Paper Packaging
		if stdlib.contains(recipe, "paper") then
			LSlib.recipe.duplicate("paper-food-2", "paper-food-"..count)
			LSlib.recipe.editIngredient("paper-food-"..count, "food-2", "food-"..count, 1 )
			LSlib.recipe.editIngredient("paper-food-"..count, "paper", "paper", i/2+1 )
			LSlib.recipe.editResult("paper-food-"..count, "paper-food-2", "paper-food-"..count, 1 )
		end
		--Aluminum Packaging
		if stdlib.contains(recipe, "aluminum") then
			LSlib.recipe.duplicate("aluminum-food-2", "aluminum-food-"..count)
			LSlib.recipe.editIngredient("aluminum-food-"..count, "food-2", "food-"..count, 1 )
			LSlib.recipe.editIngredient("aluminum-food-"..count, "aluminum-plate", "aluminum-plate", i/2+1 )
			LSlib.recipe.editResult("aluminum-food-"..count, "aluminum-food-2", "aluminum-food-"..count, 1 )
		end
	end
end