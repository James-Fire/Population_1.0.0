local MathData = require("__Population__/prototypes/Data Script")
local stdlib = require('__stdlib__/stdlib/utils/string')
data:extend({
	{
		type = "item",
		name = "child-person",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 4
	},
	{
		type = "item",
		name = "person",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "a",
		stack_size = 2
	},
	{
		type = "item",
		name = "tired-person",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Population",
		order = "b",
		stack_size = 2
	},
	--Make Children grow up
	{
		type = "recipe",
		name = "grow-person-1",
		category = "pop-rest-1",
		enabled = true,
		energy_required = MathData.RestTime*10,
		ingredients = {
			{ "person",2 },
			{ "child-person",4 },
			{ "copper-plate",10 },
			{ type = "fluid", name = "water", amount = 3*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",2 },
			{ "person",4 },
			{ "garbage",10 },
			--{ "copper-plate",10 },
			{type = "fluid", name = "sewage", amount = 3*MathData.RequiredWater },
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
		energy_required = MathData.RestTime*4,
		ingredients = {
			{ "person",8 },
			{ "child-person",16 },
			{ "copper-plate",40 },
			{ type = "fluid", name = "water", amount = 24*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",8 },
			{ "person",16 },
			{ "garbage",40 },
			--{ "copper-plate",40 },
			{type = "fluid", name = "sewage", amount = 24*MathData.RequiredWater },
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
		energy_required = MathData.RestTime*10,
		ingredients = {
			{ "person",8 },
			{ "child-person",16 },
			{ "copper-plate",40 },
			{ type = "fluid", name = "water", amount = 24*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",8 },
			{ "person",16 },
			{ "garbage",40 },
			--{ "copper-plate",40 },
			{type = "fluid", name = "sewage", amount = 24*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "a-2",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "grow-person-4",
		category = "pop-rest-4",
		enabled = false,
		energy_required = MathData.RestTime*10,
		ingredients = {
			{ "person",20 },
			{ "child-person",40 },
			{ "copper-plate",100 },
			{ type = "fluid", name = "water", amount = 60*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",20 },
			{ "person",40 },
			{ "garbage",100 },
			--{ "copper-plate",100 },
			{type = "fluid", name = "sewage", amount = 60*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "a-3",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "grow-person-5",
		category = "pop-rest-5",
		enabled = false,
		energy_required = MathData.RestTime*10,
		ingredients = {
			{ "person",20 },
			{ "child-person",40 },
			{ "copper-plate",100 },
			{ type = "fluid", name = "water", amount = 60*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",20 },
			{ "person",40 },
			{ "garbage",100 },
			--{ "copper-plate",100 },
			{type = "fluid", name = "sewage", amount = 60*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "a-4",
		main_product = "person"
	},
	--Make Children
	{
		type = "recipe",
		name = "reproduce-person-1",
		category = "pop-rest-1",
		enabled = true,
		energy_required = MathData.RestTime*4,
		ingredients = {
			{ "person",2 },
			{ "copper-plate",2 },
			{ type = "fluid", name = "water", amount = 3*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",2 },
			{ "child-person",1 },
			{ "garbage",2 },
			--{ "copper-plate",2 },
			{type = "fluid", name = "sewage", amount = 3*MathData.RequiredWater },
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
		energy_required = MathData.RestTime*4,
		ingredients = {
			{ "person",8 },
			{ "copper-plate",8 },
			{ type = "fluid", name = "water", amount = 12*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",8 },
			{ "child-person",4 },
			{ "garbage",8 },
			--{ "copper-plate",8 },
			{type = "fluid", name = "sewage", amount = 12*MathData.RequiredWater },
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
		energy_required = MathData.RestTime*4,
		ingredients = {
			{ "person",8 },
			{ "copper-plate",8 },
			{ type = "fluid", name = "water", amount = 12*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",8 },
			{ "child-person",4 },
			{ "garbage",8 },
			--{ "copper-plate",8 },
			{type = "fluid", name = "sewage", amount = 12*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "b-2",
		main_product = "child-person"
	},
	{
		type = "recipe",
		name = "reproduce-person-4",
		category = "pop-rest-4",
		enabled = false,
		energy_required = MathData.RestTime*4,
		ingredients = {
			{ "person",20 },
			{ "copper-plate",20 },
			{ type = "fluid", name = "water", amount = 30*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",20 },
			{ "child-person",10 },
			{ "garbage",20 },
			--{ "copper-plate",20 },
			{type = "fluid", name = "sewage", amount = 30*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "b-3",
		main_product = "child-person"
	},
	{
		type = "recipe",
		name = "reproduce-person-5",
		category = "pop-rest-5",
		enabled = false,
		energy_required = MathData.RestTime*4,
		ingredients = {
			{ "person",20 },
			{ "copper-plate",20 },
			{ type = "fluid", name = "water", amount = 30*MathData.RequiredWater },
		},
		results = {
			{ "tired-person",20 },
			{ "child-person",10 },
			{ "garbage",20 },
			--{ "copper-plate",20 },
			{type = "fluid", name = "sewage", amount = 30*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "b-4",
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
			{ "tired-person",2 },
			{ "copper-plate",2 },
			{ type = "fluid", name = "water", amount = 2*MathData.RequiredWater },
		},
		results = {
			{ "person",2 },
			{ "garbage",2 },
			--{ "copper-plate",2 },
			{type = "fluid", name = "sewage", amount = 2*MathData.RequiredWater },
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
			{ "tired-person",8 },
			{ "copper-plate",8 },
			{ type = "fluid", name = "water", amount = 8*MathData.RequiredWater },
		},
		results = {
			{ "person",8 },
			{ "garbage",8 },
			--{ "copper-plate",8 },
			{type = "fluid", name = "sewage", amount = 8*MathData.RequiredWater },
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
			{ "tired-person",8 },
			{ "copper-plate",8 },
			{ type = "fluid", name = "water", amount = 8*MathData.RequiredWater },
		},
		results = {
			{ "person",8 },
			{ "garbage",8 },
			--{ "copper-plate",8 },
			{type = "fluid", name = "sewage", amount = 8*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "c-2",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "rest-person-4",
		category = "pop-rest-4",
		enabled = false,
		energy_required = MathData.RestTime,
		ingredients = {
			{ "tired-person",20 },
			{ "copper-plate",20 },
			{ type = "fluid", name = "water", amount = 20*MathData.RequiredWater },
		},
		results = {
			{ "person",20 },
			{ "garbage",20 },
			--{ "copper-plate",20 },
			{type = "fluid", name = "sewage", amount = 20*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "c-3",
		main_product = "person"
	},
	{
		type = "recipe",
		name = "rest-person-5",
		category = "pop-rest-5",
		enabled = false,
		energy_required = MathData.RestTime,
		ingredients = {
			{ "tired-person",20 },
			{ "copper-plate",20 },
			{ type = "fluid", name = "water", amount = 20*MathData.RequiredWater },
		},
		results = {
			{ "person",20 },
			{ "garbage",20 },
			--{ "copper-plate",20 },
			{type = "fluid", name = "sewage", amount = 20*MathData.RequiredWater },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "Population",
		order = "c-4",
		main_product = "person"
	},
})

local PopRestRecipes = { "rest-person-1", "rest-person-2", "rest-person-3", "rest-person-4", "rest-person-5" }

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
	
	--log(serpent.block(data.raw.recipe["2-copper-"..count]))
	
	LSlib.recipe.editIngredient("2-copper-"..count, "copper-plate", "copper-food-2", 1 )
	LSlib.recipe.editIngredient("3-copper-"..count, "copper-plate", "copper-food-3", 1 )
	LSlib.recipe.editIngredient("4-copper-"..count, "copper-plate", "copper-food-4", 1 )
	LSlib.recipe.editIngredient("5-copper-"..count, "copper-plate", "copper-food-5", 1 )
	
	if count == "rest-person-1" then
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 2 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 2 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 2 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 2 )
	end
	if count == "rest-person-2" then
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 8 )
	end
	if count == "rest-person-3" then
		LSlib.technology.addRecipeUnlock("steel-processing", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 8 )
	end
	if count == "rest-person-4" then
		LSlib.technology.addRecipeUnlock("concrete", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 20 )
	end
	if count == "rest-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 20 )
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
	
	LSlib.recipe.editIngredient("2-paper-"..count, "copper-plate", "paper-food-2", 1 )
	LSlib.recipe.editIngredient("3-paper-"..count, "copper-plate", "paper-food-3", 1 )
	LSlib.recipe.editIngredient("4-paper-"..count, "copper-plate", "paper-food-4", 1 )
	LSlib.recipe.editIngredient("5-paper-"..count, "copper-plate", "paper-food-5", 1 )
	
	if count == "rest-person-1" then
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 2 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 2 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 2 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 2 )
	end
	if count == "rest-person-2" then
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 8 )
	end
	if count == "rest-person-3" then
		LSlib.technology.addRecipeUnlock("steel-processing", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 8 )
	end
	if count == "rest-person-4" then
		LSlib.technology.addRecipeUnlock("concrete", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 20 )
	end
	if count == "rest-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 20 )
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
	
	LSlib.recipe.editIngredient("2-plastic-"..count, "copper-plate", "plastic-food-2", 1 )
	LSlib.recipe.editIngredient("3-plastic-"..count, "copper-plate", "plastic-food-3", 1 )
	LSlib.recipe.editIngredient("4-plastic-"..count, "copper-plate", "plastic-food-4", 1 )
	LSlib.recipe.editIngredient("5-plastic-"..count, "copper-plate", "plastic-food-5", 1 )
	
	if count == "rest-person-1" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.disable("2-plastic-"..count)
		LSlib.recipe.disable("3-plastic-"..count)
		LSlib.recipe.disable("4-plastic-"..count)
		LSlib.recipe.disable("5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 2 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 2 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 2 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 2 )
	end
	if count == "rest-person-2" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.disable("2-plastic-"..count)
		LSlib.recipe.disable("3-plastic-"..count)
		LSlib.recipe.disable("4-plastic-"..count)
		LSlib.recipe.disable("5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 8 )
	end
	if count == "rest-person-3" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 8 )
	end
	if count == "rest-person-4" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 20 )
	end
	if count == "rest-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 20 )
	end
end

local PopReproduceRecipes = { "reproduce-person-1", "reproduce-person-2", "reproduce-person-3", "reproduce-person-4", "reproduce-person-5" }

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
	
	if count == "reproduce-person-1" then
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 2 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 2 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 2 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 2 )
	end
	if count == "reproduce-person-2" then
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 8 )
	end
	if count == "reproduce-person-3" then
		LSlib.technology.addRecipeUnlock("steel-processing", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 8 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 8 )
	end
	if count == "reproduce-person-4" then
		LSlib.technology.addRecipeUnlock("concrete", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 20 )
	end
	if count == "reproduce-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 20 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 20 )
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
	
	if count == "reproduce-person-1" then
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 2 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 2 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 2 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 2 )
	end
	if count == "reproduce-person-2" then
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 8 )
	end
	if count == "reproduce-person-3" then
		LSlib.technology.addRecipeUnlock("steel-processing", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 8 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 8 )
	end
	if count == "reproduce-person-4" then
		LSlib.technology.addRecipeUnlock("concrete", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 20 )
	end
	if count == "reproduce-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 20 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 20 )
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
	
	if count == "reproduce-person-1" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.disable("2-plastic-"..count)
		LSlib.recipe.disable("3-plastic-"..count)
		LSlib.recipe.disable("4-plastic-"..count)
		LSlib.recipe.disable("5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 2 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 2 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 2 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 2 )
	end
	if count == "reproduce-person-2" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.disable("2-plastic-"..count)
		LSlib.recipe.disable("3-plastic-"..count)
		LSlib.recipe.disable("4-plastic-"..count)
		LSlib.recipe.disable("5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 8 )
	end
	if count == "reproduce-person-3" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 8 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 8 )
	end
	if count == "reproduce-person-4" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 20 )
	end
	if count == "reproduce-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 20 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 20 )
	end
end

local PopGrowRecipes = { "grow-person-1", "grow-person-2", "grow-person-3", "grow-person-4", "grow-person-5" }

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
	
	if count == "grow-person-1" then
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 10 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 10 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 10 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 10 )
	end
	if count == "grow-person-2" then
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 40 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 40 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 40 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 40 )
	end
	if count == "grow-person-3" then
		LSlib.technology.addRecipeUnlock("steel-processing", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 40 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 40 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 40 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 40 )
	end
	if count == "grow-person-4" then
		LSlib.technology.addRecipeUnlock("concrete", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 100 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 100 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 100 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 100 )
	end
	if count == "grow-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-copper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-copper-"..count)
		
		LSlib.recipe.addResult("2-copper-"..count, "copper-recycling", 100 )
		LSlib.recipe.addResult("3-copper-"..count, "copper-recycling", 100 )
		LSlib.recipe.addResult("4-copper-"..count, "copper-recycling", 100 )
		LSlib.recipe.addResult("5-copper-"..count, "copper-recycling", 100 )
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
	
	LSlib.recipe.editResult("2-paper-"..count, "copper-plate", "paper-recycling", 1	)
	LSlib.recipe.editResult("3-paper-"..count, "copper-plate", "paper-recycling", 1 )
	LSlib.recipe.editResult("4-paper-"..count, "copper-plate", "paper-recycling", 1 )
	LSlib.recipe.editResult("5-paper-"..count, "copper-plate", "paper-recycling", 1 )
	
	if count == "grow-person-1" then
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 10 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 10 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 10 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 10 )
	end
	if count == "grow-person-2" then
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 40 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 40 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 40 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 40 )
	end
	if count == "grow-person-3" then
		LSlib.technology.addRecipeUnlock("steel-processing", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("steel-processing", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 40 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 40 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 40 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 40 )
	end
	if count == "grow-person-4" then
		LSlib.technology.addRecipeUnlock("concrete", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("concrete", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 100 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 100 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 100 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 100 )
	end
	if count == "grow-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-paper-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-paper-"..count)
		
		LSlib.recipe.addResult("2-paper-"..count, "paper-recycling", 100 )
		LSlib.recipe.addResult("3-paper-"..count, "paper-recycling", 100 )
		LSlib.recipe.addResult("4-paper-"..count, "paper-recycling", 100 )
		LSlib.recipe.addResult("5-paper-"..count, "paper-recycling", 100 )
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
	
	if count == "grow-person-1" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.disable("2-plastic-"..count)
		LSlib.recipe.disable("3-plastic-"..count)
		LSlib.recipe.disable("4-plastic-"..count)
		LSlib.recipe.disable("5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 10 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 10 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 10 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 10 )
	end
	if count == "grow-person-2" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.disable("2-plastic-"..count)
		LSlib.recipe.disable("3-plastic-"..count)
		LSlib.recipe.disable("4-plastic-"..count)
		LSlib.recipe.disable("5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 40 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 40 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 40 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 40 )
	end
	if count == "grow-person-3" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 40 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 40 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 40 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 40 )
	end
	if count == "grow-person-4" then
		LSlib.technology.addRecipeUnlock("plastics", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("plastics", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 100 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 100 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 100 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 100 )
	end
	if count == "grow-person-5" then
		LSlib.technology.addRecipeUnlock("low-density-structure", "2-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "3-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "4-plastic-"..count)
		LSlib.technology.addRecipeUnlock("low-density-structure", "5-plastic-"..count)
		
		LSlib.recipe.addResult("2-plastic-"..count, "plastic-recycling", 100 )
		LSlib.recipe.addResult("3-plastic-"..count, "plastic-recycling", 100 )
		LSlib.recipe.addResult("4-plastic-"..count, "plastic-recycling", 100 )
		LSlib.recipe.addResult("5-plastic-"..count, "plastic-recycling", 100 )
	end
end

LSlib.recipe.disable("rest-person-1")
LSlib.recipe.disable("rest-person-2")
LSlib.recipe.disable("reproduce-person-1")
LSlib.recipe.disable("reproduce-person-2")
LSlib.recipe.disable("grow-person-1")
LSlib.recipe.disable("grow-person-2")

--Since furnaces can only have 1 input, I can't use them to automatically handle this complexity.
--Hidden assemblers that can take in stuff and spit out "prepared" pops that the housing buildings then rest? Bad, would need an assembler for every combination, and it would automatically fill irrelevant ones.
--Housing is assemblers. Remove multi-use and rest as a thing. Players will have to manually select what food packaging, luxuries, and so on.
--Luxury levels for housing that dictates how many luxuries can be used?

--Paper Packaging Rest
	--make_package_rest_recipes("paper","paper-waste")

--Plastic Packaging Rest

--Iron Packaging Rest

--Aluminum Packaging Rest

