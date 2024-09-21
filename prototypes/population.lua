local MathData = require("__Population__/prototypes/Data Script")
data:extend({
	--Stasis pods for dense people storage for game start
	{
		type = "item",
		name = "population-stasis-pod",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Stasis",
		order = "a",
		stack_size = 20
	},
	{
		type = "item",
		name = "population-child-stasis-pod",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Stasis",
		order = "a",
		stack_size = 20
	},
	{
		type = "recipe",
		name = "stasis-pod",
		category = "crafting",
		enabled = true,
		energy_required = 1,
		ingredients = {
			{"population-stasis-pod", 1},
		},
		results = {
			{"person", 40},
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Stasis",
		order = "a-0",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "child-stasis-pod",
		category = "crafting",
		enabled = true,
		energy_required = 1,
		ingredients = {
			{"population-child-stasis-pod", 1},
		},
		results = {
			{"child-person", 80},
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Stasis",
		order = "a-1",
		main_product = "child-person"
	},
	{
		type = "item",
		name = "child-person",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 8
	},
	{
		type = "item",
		name = "person",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 4
	},
	{
		type = "item",
		name = "tired-person",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "b",
		stack_size = 4
	},
	--Make Children grow up
	{
		type = "recipe",
		name = "grow-person-1",
		category = "pop-rest-1",
		enabled = true,
		energy_required = MathData.RestTime*MathData.GrowthTime,
		ingredients = {
			{ "person",MathData.HousingPopRecipe[1] },
			{ "child-person",MathData.HousingPopChildrenGrow[1] },
			{ "copper-plate",MathData.HousingPopGrowRecipe[1] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopGrowRecipe[1]*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",MathData.HousingPopRecipe[1] },
			{ "person",MathData.HousingPopChildrenGrow[1] },
			{ "garbage",MathData.HousingPopGrowRecipe[1] },
			{ "copper-plate",MathData.HousingPopGrowRecipe[1] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopGrowRecipe[1]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "a-0",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "grow-person-2",
		category = "pop-rest-2",
		enabled = true,
		energy_required = MathData.RestTime*MathData.GrowthTime,
		ingredients = {
			{ "person",MathData.HousingPopRecipe[2] },
			{ "child-person",MathData.HousingPopChildrenGrow[2] },
			{ "copper-plate",MathData.HousingPopGrowRecipe[2] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopGrowRecipe[2]*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",MathData.HousingPopRecipe[2] },
			{ "person",MathData.HousingPopChildrenGrow[2] },
			{ "garbage",MathData.HousingPopGrowRecipe[2] },
			{ "copper-plate",MathData.HousingPopGrowRecipe[2] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopGrowRecipe[2]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "a-1",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "grow-person-3",
		category = "pop-rest-3",
		enabled = false,
		energy_required = MathData.RestTime*MathData.GrowthTime,
		ingredients = {
			{ "person",MathData.HousingPopRecipe[3] },
			{ "child-person",MathData.HousingPopChildrenGrow[3] },
			{ "copper-plate",MathData.HousingPopGrowRecipe[3] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopGrowRecipe[3]*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",MathData.HousingPopRecipe[3] },
			{ "person",MathData.HousingPopChildrenGrow[3] },
			{ "garbage",MathData.HousingPopGrowRecipe[3] },
			{ "copper-plate",MathData.HousingPopGrowRecipe[3] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopGrowRecipe[3]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "a-2",
		main_product = "person"
	},
	--Make Children
	{
		type = "recipe",
		name = "reproduce-person-1",
		category = "pop-rest-1",
		enabled = true,
		energy_required = MathData.RestTime*MathData.GrowthTime,
		ingredients = {
			{ "person",MathData.HousingPopRecipe[1] },
			{ "copper-plate",MathData.HousingPopReproRecipe[1] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopReproRecipe[1]*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",MathData.HousingPopRecipe[1] },
			{ "child-person",MathData.HousingPopChildren[1] },
			{ "garbage",MathData.HousingPopReproRecipe[1] },
			{ "copper-plate",MathData.HousingPopReproRecipe[1] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopReproRecipe[1]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "b-0",
		main_product = "child-person"
	},
	{
		type = "recipe",
		name = "reproduce-person-2",
		category = "pop-rest-2",
		enabled = true,
		energy_required = MathData.RestTime*MathData.GrowthTime,
		ingredients = {
			{ "person",MathData.HousingPopRecipe[2] },
			{ "copper-plate",MathData.HousingPopReproRecipe[2] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopReproRecipe[2]*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",MathData.HousingPopRecipe[2] },
			{ "child-person",MathData.HousingPopChildren[2] },
			{ "garbage",MathData.HousingPopReproRecipe[2] },
			{ "copper-plate",MathData.HousingPopReproRecipe[2] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopReproRecipe[2]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "b-1",
		main_product = "child-person"
	},
	{
		type = "recipe",
		name = "reproduce-person-3",
		category = "pop-rest-3",
		enabled = false,
		energy_required = MathData.RestTime*MathData.GrowthTime,
		ingredients = {
			{ "person",MathData.HousingPopRecipe[3] },
			{ "copper-plate",MathData.HousingPopReproRecipe[3] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopReproRecipe[3]*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",MathData.HousingPopRecipe[3] },
			{ "child-person",MathData.HousingPopChildren[3] },
			{ "garbage",MathData.HousingPopReproRecipe[3] },
			{ "copper-plate",MathData.HousingPopReproRecipe[3] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopReproRecipe[3]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "b-2",
		main_product = "child-person"
	},
	--Base Rest Recipes that are then copied. They do not show up.
	{
		type = "recipe",
		name = "rest-person-1",
		category = "pop-rest-1",
		enabled = true,
		energy_required = MathData.RestTime,
		ingredients = {
			{ "tired-person",MathData.HousingPopRecipe[1] },
			{ "copper-plate",MathData.HousingPopRecipe[1] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopRecipe[1]*MathData.RequiredWater },
		},
		results = {
			{ "person",MathData.HousingPopRecipe[1] },
			{ "garbage",MathData.HousingPopRecipe[1] },
			{ "copper-plate",MathData.HousingPopRecipe[1] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopRecipe[1]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "c-0",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "rest-person-2",
		category = "pop-rest-2",
		enabled = true,
		energy_required = MathData.RestTime,
		ingredients = {
			{ "tired-person",MathData.HousingPopRecipe[2] },
			{ "copper-plate",MathData.HousingPopRecipe[2] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopRecipe[2]*MathData.RequiredWater },
		},
		results = {
			{ "person",MathData.HousingPopRecipe[2] },
			{ "garbage",MathData.HousingPopRecipe[2] },
			{ "copper-plate",MathData.HousingPopRecipe[2] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopRecipe[2]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "c-1",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "rest-person-3",
		category = "pop-rest-3",
		enabled = false,
		energy_required = MathData.RestTime,
		ingredients = {
			{ "tired-person",MathData.HousingPopRecipe[3] },
			{ "copper-plate",MathData.HousingPopRecipe[3] },
			{ type = "fluid", name = "treated-water", amount = MathData.HousingPopRecipe[3]*MathData.RequiredWater },
		},
		results = {
			{ "person",MathData.HousingPopRecipe[3] },
			{ "garbage",MathData.HousingPopRecipe[3] },
			{ "copper-plate",MathData.HousingPopRecipe[3] },
			{type = "fluid", name = "sewage", amount = MathData.HousingPopRecipe[3]*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "c-2",
		main_product = "person"
	},
})

local PopRestRecipes = { "rest-person-1", "rest-person-2", "rest-person-3" }

for _, count in pairs(PopRestRecipes) do
	LSlib.recipe.duplicate(count, "2-copper-"..count)
	LSlib.recipe.duplicate(count, "3-copper-"..count)
	LSlib.recipe.duplicate(count, "4-copper-"..count)
	LSlib.recipe.duplicate(count, "5-copper-"..count)
	
	LSlib.recipe.setSubgroup("2-copper-"..count, "Copper-Rest")
	LSlib.recipe.setSubgroup("3-copper-"..count, "Copper-Rest")
	LSlib.recipe.setSubgroup("4-copper-"..count, "Copper-Rest")
	LSlib.recipe.setSubgroup("5-copper-"..count, "Copper-Rest")
	
	LSlib.recipe.editEnergyRequired("3-copper-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-copper-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-copper-"..count, 0.85)
	
	--log("Before editing results and ingredients"..serpent.block(data.raw.recipe["2-copper-"..count]))
	
	LSlib.recipe.editResult("2-copper-"..count, "copper-plate", "copper-recycling", 2 )
	LSlib.recipe.editResult("3-copper-"..count, "copper-plate", "copper-recycling", 3 )
	LSlib.recipe.editResult("4-copper-"..count, "copper-plate", "copper-recycling", 4 )
	LSlib.recipe.editResult("5-copper-"..count, "copper-plate", "copper-recycling", 5 )
	
	LSlib.recipe.editIngredient("2-copper-"..count, "copper-plate", "copper-food-2", 1 )
	LSlib.recipe.editIngredient("3-copper-"..count, "copper-plate", "copper-food-3", 1 )
	LSlib.recipe.editIngredient("4-copper-"..count, "copper-plate", "copper-food-4", 1 )
	LSlib.recipe.editIngredient("5-copper-"..count, "copper-plate", "copper-food-5", 1 )
	
	--log("After editing results and ingredients"..serpent.block(data.raw.recipe["2-copper-"..count]))
	
	if count == "rest-person-3" then
		LSlib.technology.addRecipeUnlock("concrete", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-copper-"..count)
	end
	
	LSlib.recipe.duplicate(count, "2-paper-"..count)
	LSlib.recipe.duplicate(count, "3-paper-"..count)
	LSlib.recipe.duplicate(count, "4-paper-"..count)
	LSlib.recipe.duplicate(count, "5-paper-"..count)
	
	LSlib.recipe.setSubgroup("2-paper-"..count, "Paper-Rest")
	LSlib.recipe.setSubgroup("3-paper-"..count, "Paper-Rest")
	LSlib.recipe.setSubgroup("4-paper-"..count, "Paper-Rest")
	LSlib.recipe.setSubgroup("5-paper-"..count, "Paper-Rest")
	
	LSlib.recipe.editEnergyRequired("3-paper-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-paper-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-paper-"..count, 0.85)
	
	LSlib.recipe.editResult("2-paper-"..count, "copper-plate", "paper-recycling", 2	)
	LSlib.recipe.editResult("3-paper-"..count, "copper-plate", "paper-recycling", 3 )
	LSlib.recipe.editResult("4-paper-"..count, "copper-plate", "paper-recycling", 4 )
	LSlib.recipe.editResult("5-paper-"..count, "copper-plate", "paper-recycling", 5 )
	
	LSlib.recipe.editIngredient("2-paper-"..count, "copper-plate", "paper-food-2", 1 )
	LSlib.recipe.editIngredient("3-paper-"..count, "copper-plate", "paper-food-3", 1 )
	LSlib.recipe.editIngredient("4-paper-"..count, "copper-plate", "paper-food-4", 1 )
	LSlib.recipe.editIngredient("5-paper-"..count, "copper-plate", "paper-food-5", 1 )
	
	if count == "rest-person-3" then
		LSlib.technology.addRecipeUnlock("concrete", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-paper-"..count)
	end
	
	LSlib.recipe.duplicate(count, "2-plastic-"..count)
	LSlib.recipe.duplicate(count, "3-plastic-"..count)
	LSlib.recipe.duplicate(count, "4-plastic-"..count)
	LSlib.recipe.duplicate(count, "5-plastic-"..count)
	
	LSlib.recipe.setSubgroup("2-plastic-"..count, "Plastic-Rest")
	LSlib.recipe.setSubgroup("3-plastic-"..count, "Plastic-Rest")
	LSlib.recipe.setSubgroup("4-plastic-"..count, "Plastic-Rest")
	LSlib.recipe.setSubgroup("5-plastic-"..count, "Plastic-Rest")
	
	LSlib.recipe.editEnergyRequired("3-plastic-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-plastic-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-plastic-"..count, 0.85)
	
	LSlib.recipe.editResult("2-plastic-"..count, "copper-plate", "plastic-recycling", 2 )
	LSlib.recipe.editResult("3-plastic-"..count, "copper-plate", "plastic-recycling", 3 )
	LSlib.recipe.editResult("4-plastic-"..count, "copper-plate", "plastic-recycling", 4 )
	LSlib.recipe.editResult("5-plastic-"..count, "copper-plate", "plastic-recycling", 5 )
	
	LSlib.recipe.editIngredient("2-plastic-"..count, "copper-plate", "plastic-food-2", 1 )
	LSlib.recipe.editIngredient("3-plastic-"..count, "copper-plate", "plastic-food-3", 1 )
	LSlib.recipe.editIngredient("4-plastic-"..count, "copper-plate", "plastic-food-4", 1 )
	LSlib.recipe.editIngredient("5-plastic-"..count, "copper-plate", "plastic-food-5", 1 )

	LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
	
	LSlib.recipe.disable("2-plastic-"..count)
	LSlib.recipe.disable("3-plastic-"..count)
	LSlib.recipe.disable("4-plastic-"..count)
	LSlib.recipe.disable("5-plastic-"..count)
end

local PopReproduceRecipes = { "reproduce-person-1", "reproduce-person-2", "reproduce-person-3" }

for _, count in pairs(PopReproduceRecipes) do
	LSlib.recipe.duplicate(count, "2-copper-"..count)
	LSlib.recipe.duplicate(count, "3-copper-"..count)
	LSlib.recipe.duplicate(count, "4-copper-"..count)
	LSlib.recipe.duplicate(count, "5-copper-"..count)
	
	LSlib.recipe.setSubgroup("2-copper-"..count, "Copper-Reproduce")
	LSlib.recipe.setSubgroup("3-copper-"..count, "Copper-Reproduce")
	LSlib.recipe.setSubgroup("4-copper-"..count, "Copper-Reproduce")
	LSlib.recipe.setSubgroup("5-copper-"..count, "Copper-Reproduce")
	
	LSlib.recipe.editEnergyRequired("3-copper-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-copper-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-copper-"..count, 0.85)
	
	LSlib.recipe.editIngredient("2-copper-"..count, "copper-plate", "copper-food-2", 1 )
	LSlib.recipe.editIngredient("3-copper-"..count, "copper-plate", "copper-food-3", 1 )
	LSlib.recipe.editIngredient("4-copper-"..count, "copper-plate", "copper-food-4", 1 )
	LSlib.recipe.editIngredient("5-copper-"..count, "copper-plate", "copper-food-5", 1 )
	
	LSlib.recipe.editResult("2-copper-"..count, "copper-plate", "copper-recycling", 2 )
	LSlib.recipe.editResult("3-copper-"..count, "copper-plate", "copper-recycling", 3 )
	LSlib.recipe.editResult("4-copper-"..count, "copper-plate", "copper-recycling", 4 )
	LSlib.recipe.editResult("5-copper-"..count, "copper-plate", "copper-recycling", 5 )

	if count == "reproduce-person-3" then
		LSlib.technology.addRecipeUnlock("concrete", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-copper-"..count)
	end
	
	LSlib.recipe.duplicate(count, "2-paper-"..count)
	LSlib.recipe.duplicate(count, "3-paper-"..count)
	LSlib.recipe.duplicate(count, "4-paper-"..count)
	LSlib.recipe.duplicate(count, "5-paper-"..count)
	
	LSlib.recipe.setSubgroup("2-paper-"..count, "Paper-Reproduce")
	LSlib.recipe.setSubgroup("3-paper-"..count, "Paper-Reproduce")
	LSlib.recipe.setSubgroup("4-paper-"..count, "Paper-Reproduce")
	LSlib.recipe.setSubgroup("5-paper-"..count, "Paper-Reproduce")
	
	LSlib.recipe.editEnergyRequired("3-paper-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-paper-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-paper-"..count, 0.85)
	
	LSlib.recipe.editIngredient("2-paper-"..count, "copper-plate", "paper-food-2", 1 )
	LSlib.recipe.editIngredient("3-paper-"..count, "copper-plate", "paper-food-3", 1 )
	LSlib.recipe.editIngredient("4-paper-"..count, "copper-plate", "paper-food-4", 1 )
	LSlib.recipe.editIngredient("5-paper-"..count, "copper-plate", "paper-food-5", 1 )
	
	LSlib.recipe.editResult("2-paper-"..count, "copper-plate", "paper-recycling", 2	)
	LSlib.recipe.editResult("3-paper-"..count, "copper-plate", "paper-recycling", 3 )
	LSlib.recipe.editResult("4-paper-"..count, "copper-plate", "paper-recycling", 4 )
	LSlib.recipe.editResult("5-paper-"..count, "copper-plate", "paper-recycling", 5 )

	if count == "reproduce-person-3" then
		LSlib.technology.addRecipeUnlock("concrete", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-paper-"..count)
	end
	
	LSlib.recipe.duplicate(count, "2-plastic-"..count)
	LSlib.recipe.duplicate(count, "3-plastic-"..count)
	LSlib.recipe.duplicate(count, "4-plastic-"..count)
	LSlib.recipe.duplicate(count, "5-plastic-"..count)
	
	LSlib.recipe.setSubgroup("2-plastic-"..count, "Plastic-Reproduce")
	LSlib.recipe.setSubgroup("3-plastic-"..count, "Plastic-Reproduce")
	LSlib.recipe.setSubgroup("4-plastic-"..count, "Plastic-Reproduce")
	LSlib.recipe.setSubgroup("5-plastic-"..count, "Plastic-Reproduce")
	
	LSlib.recipe.editEnergyRequired("3-plastic-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-plastic-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-plastic-"..count, 0.85)
	
	LSlib.recipe.editIngredient("2-plastic-"..count, "copper-plate", "plastic-food-2", 1 )
	LSlib.recipe.editIngredient("3-plastic-"..count, "copper-plate", "plastic-food-3", 1 )
	LSlib.recipe.editIngredient("4-plastic-"..count, "copper-plate", "plastic-food-4", 1 )
	LSlib.recipe.editIngredient("5-plastic-"..count, "copper-plate", "plastic-food-5", 1 )
	
	LSlib.recipe.editResult("2-plastic-"..count, "copper-plate", "plastic-recycling", 2 )
	LSlib.recipe.editResult("3-plastic-"..count, "copper-plate", "plastic-recycling", 3 )
	LSlib.recipe.editResult("4-plastic-"..count, "copper-plate", "plastic-recycling", 4 )
	LSlib.recipe.editResult("5-plastic-"..count, "copper-plate", "plastic-recycling", 5 )

	LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
	
	LSlib.recipe.disable("2-plastic-"..count)
	LSlib.recipe.disable("3-plastic-"..count)
	LSlib.recipe.disable("4-plastic-"..count)
	LSlib.recipe.disable("5-plastic-"..count)
end

local PopGrowRecipes = { "grow-person-1", "grow-person-2", "grow-person-3" }

for _, count in pairs(PopGrowRecipes) do
	LSlib.recipe.duplicate(count, "2-copper-"..count)
	LSlib.recipe.duplicate(count, "3-copper-"..count)
	LSlib.recipe.duplicate(count, "4-copper-"..count)
	LSlib.recipe.duplicate(count, "5-copper-"..count)
	
	LSlib.recipe.setSubgroup("2-copper-"..count, "Copper-Grow")
	LSlib.recipe.setSubgroup("3-copper-"..count, "Copper-Grow")
	LSlib.recipe.setSubgroup("4-copper-"..count, "Copper-Grow")
	LSlib.recipe.setSubgroup("5-copper-"..count, "Copper-Grow")
	
	LSlib.recipe.editEnergyRequired("3-copper-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-copper-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-copper-"..count, 0.85)
	
	LSlib.recipe.editIngredient("2-copper-"..count, "copper-plate", "copper-food-2", 1 )
	LSlib.recipe.editIngredient("3-copper-"..count, "copper-plate", "copper-food-3", 1 )
	LSlib.recipe.editIngredient("4-copper-"..count, "copper-plate", "copper-food-4", 1 )
	LSlib.recipe.editIngredient("5-copper-"..count, "copper-plate", "copper-food-5", 1 )
	
	LSlib.recipe.editResult("2-copper-"..count, "copper-plate", "copper-recycling", 2 )
	LSlib.recipe.editResult("3-copper-"..count, "copper-plate", "copper-recycling", 3 )
	LSlib.recipe.editResult("4-copper-"..count, "copper-plate", "copper-recycling", 4 )
	LSlib.recipe.editResult("5-copper-"..count, "copper-plate", "copper-recycling", 5 )
	
	if count == "grow-person-3" then
		LSlib.technology.addRecipeUnlock("concrete", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-copper-"..count)
	end
	
	LSlib.recipe.duplicate(count, "2-paper-"..count)
	LSlib.recipe.duplicate(count, "3-paper-"..count)
	LSlib.recipe.duplicate(count, "4-paper-"..count)
	LSlib.recipe.duplicate(count, "5-paper-"..count)
	
	LSlib.recipe.setSubgroup("2-paper-"..count, "Paper-Grow")
	LSlib.recipe.setSubgroup("3-paper-"..count, "Paper-Grow")
	LSlib.recipe.setSubgroup("4-paper-"..count, "Paper-Grow")
	LSlib.recipe.setSubgroup("5-paper-"..count, "Paper-Grow")
	
	LSlib.recipe.editEnergyRequired("3-paper-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-paper-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-paper-"..count, 0.85)
	
	LSlib.recipe.editIngredient("2-paper-"..count, "copper-plate", "paper-food-2", 1 )
	LSlib.recipe.editIngredient("3-paper-"..count, "copper-plate", "paper-food-3", 1 )
	LSlib.recipe.editIngredient("4-paper-"..count, "copper-plate", "paper-food-4", 1 )
	LSlib.recipe.editIngredient("5-paper-"..count, "copper-plate", "paper-food-5", 1 )
	
	LSlib.recipe.editResult("2-paper-"..count, "copper-plate", "paper-recycling", 2	)
	LSlib.recipe.editResult("3-paper-"..count, "copper-plate", "paper-recycling", 3 )
	LSlib.recipe.editResult("4-paper-"..count, "copper-plate", "paper-recycling", 4 )
	LSlib.recipe.editResult("5-paper-"..count, "copper-plate", "paper-recycling", 5 )

	if count == "grow-person-3" then
		LSlib.technology.addRecipeUnlock("concrete", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-paper-"..count)
	end
	
	LSlib.recipe.duplicate(count, "2-plastic-"..count)
	LSlib.recipe.duplicate(count, "3-plastic-"..count)
	LSlib.recipe.duplicate(count, "4-plastic-"..count)
	LSlib.recipe.duplicate(count, "5-plastic-"..count)
	
	LSlib.recipe.setSubgroup("2-plastic-"..count, "Plastic-Grow")
	LSlib.recipe.setSubgroup("3-plastic-"..count, "Plastic-Grow")
	LSlib.recipe.setSubgroup("4-plastic-"..count, "Plastic-Grow")
	LSlib.recipe.setSubgroup("5-plastic-"..count, "Plastic-Grow")
	
	LSlib.recipe.editEnergyRequired("3-plastic-"..count, 0.95)
	LSlib.recipe.editEnergyRequired("4-plastic-"..count, 0.90)
	LSlib.recipe.editEnergyRequired("5-plastic-"..count, 0.85)
	
	LSlib.recipe.editIngredient("2-plastic-"..count, "copper-plate", "plastic-food-2", 1 )
	LSlib.recipe.editIngredient("3-plastic-"..count, "copper-plate", "plastic-food-3", 1 )
	LSlib.recipe.editIngredient("4-plastic-"..count, "copper-plate", "plastic-food-4", 1 )
	LSlib.recipe.editIngredient("5-plastic-"..count, "copper-plate", "plastic-food-5", 1 )
	
	LSlib.recipe.editResult("2-plastic-"..count, "copper-plate", "plastic-recycling", 2 )
	LSlib.recipe.editResult("3-plastic-"..count, "copper-plate", "plastic-recycling", 3 )
	LSlib.recipe.editResult("4-plastic-"..count, "copper-plate", "plastic-recycling", 4 )
	LSlib.recipe.editResult("5-plastic-"..count, "copper-plate", "plastic-recycling", 5 )
	
	LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
	LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
	
	LSlib.recipe.disable("2-plastic-"..count)
	LSlib.recipe.disable("3-plastic-"..count)
	LSlib.recipe.disable("4-plastic-"..count)
	LSlib.recipe.disable("5-plastic-"..count)
end

LSlib.recipe.disable("rest-person-1")
LSlib.recipe.disable("rest-person-2")
LSlib.recipe.disable("rest-person-3")
LSlib.recipe.disable("reproduce-person-1")
LSlib.recipe.disable("reproduce-person-2")
LSlib.recipe.disable("reproduce-person-3")
LSlib.recipe.disable("grow-person-1")
LSlib.recipe.disable("grow-person-2")
LSlib.recipe.disable("grow-person-3")

--Since furnaces can only have 1 input, I can't use them to automatically handle this complexity.
--Hidden assemblers that can take in stuff and spit out "prepared" pops that the housing buildings then rest? Bad, would need an assembler for every combination, and it would automatically fill irrelevant ones.
--Housing is assemblers. Remove multi-use and rest as a thing. Players will have to manually select what food packaging, luxuries, and so on.
--Luxury levels for housing that dictates how many luxuries can be used?

--Paper Packaging Rest
	--make_package_rest_recipes("paper","paper-waste")

--Plastic Packaging Rest

--Iron Packaging Rest

--Aluminum Packaging Rest

