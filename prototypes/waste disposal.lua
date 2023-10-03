local MathData = require("__Population__/prototypes/Data Script")

data:extend({
	--Sewage Handling
	{
		type = "fluid",
		name = "sewage",
		default_temperature = 15,
		max_temperature = 100,
		heat_capacity = "0.2KJ",
		base_color = {r=0.1, g=0.1, b=0.1},
		flow_color = {r=0.1, g=0.1, b=0.1},
		icon = "__Population__/graphics/icons/sewage.png",
		icon_size = 64,
		order = "x[fluid]-a[water]",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
	},
	{
		type = "item",
		name = "sewage-treatment-plant",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Recycling",
		place_result = "sewage-treatment-plant",
		order = "a",
		stack_size = 5
	},
	{
		type = "item",
		name = "organic-material",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Recycling",
		fuel_category = "chemical",
		fuel_value = "1MJ",
		order = "a",
		stack_size = 100
	},
	{
		type = "item",
		name = "fertilizer",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Recycling",
		order = "a",
		stack_size = 100
	},
	{
		type = "recipe",
		name = "septic-treatment",
		category = "septic",
		enabled = true,
		energy_required = 30,
		ingredients = {
			{type = "fluid", name = "sewage", amount = 20 },
		},
		results = {
			{ "organic-material",1 },
			{ "garbage",1 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "a",
		main_product = "garbage"
	},
	{
		type = "recipe",
		name = "sewage-treatment",
		category = "sewage-treatment",
		enabled = false,
		energy_required = 6,
		ingredients = {
			{type = "fluid", name = "sewage", amount = 40 },
		},
		results = {
			{ type = "fluid", name = "water", amount = 38 },
			{ "organic-material",1 },
			{ "garbage",1 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "a",
		main_product = "water"
	},
	--Garbage handling
	{
		type = "item",
		name = "garbage",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Recycling",
		order = "a",
		stack_size = 100,
		fuel_category = "chemical",
		fuel_value = "1MJ",
		fuel_emissions_multiplier = 1.5,
	},
	{
		type = "item",
		name = "paper-recycling",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Recycling",
		order = "a",
		stack_size = 100,
		fuel_category = "chemical",
		fuel_value = "1MJ",
		fuel_emissions_multiplier = 1.5,
	},
	{
		type = "item",
		name = "copper-recycling",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Recycling",
		order = "a",
		stack_size = 100,
		fuel_category = "chemical",
		fuel_value = "1MJ",
		fuel_emissions_multiplier = 2,
	},
	{
		type = "item",
		name = "plastic-recycling",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Recycling",
		order = "a",
		stack_size = 100,
		fuel_category = "chemical",
		fuel_value = "1MJ",
		fuel_emissions_multiplier = 3,
	},
	--Recycling Recipes
	{
		type = "recipe",
		name = "paper-recycling",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 5,
		ingredients = {
			{ "paper-recycling",10 },
			{type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{ "paper",5 },
			{ "organic-material",3 },
			{ "garbage",2 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		main_product = "paper",
		subgroup = "Recycling",
		order = "a-0",
	},
	{
		type = "recipe",
		name = "copper-recycling",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "copper-recycling",10 },
		},
		results = {
			{ "copper-plate",8 },
			{ "garbage",2 },
		},
		main_product = "copper-plate",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "a-1",
	},
	{
		type = "recipe",
		name = "plastic-recycling",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 10,
		ingredients = {
			{ "plastic-recycling",15 },
			{type = "fluid", name = "water", amount = 30 },
		},
		results = {
			{ "plastic-bar",10 },
			{ "plastic-recycling",5 },
		},
		main_product = "plastic-bar",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "a-2",
	},
	{
		type = "recipe",
		name = "organic-material-gas",
		category = "chemistry",
		enabled = false,
		energy_required = 6,
		ingredients = {
			{ "organic-material",20 },
			{type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{type = "fluid", name = "petroleum-gas", amount = 30 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "b-1",
	},
	{
		type = "recipe",
		name = "organic-garbage-gas",
		category = "chemistry",
		enabled = false,
		energy_required = 10,
		ingredients = {
			{ "organic-material",15 },
			{ "garbage",15 },
			{type = "fluid", name = "water", amount = 10 },
		},
		results = {
			{type = "fluid", name = "petroleum-gas", amount = 45 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "b-3",
	},
	{
		type = "recipe",
		name = "garbage-recycling",
		category = "chemistry",
		enabled = false,
		energy_required = 3,
		ingredients = {
			{ "garbage",5 },
		},
		results = {
			{ "organic-material",2 },
			{ "plastic-recycling",1 },
			{ "copper-recycling",1 },
			{ "paper-recycling",1 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		main_product = "organic-material",
		subgroup = "Recycling",
		order = "b-3",
	},
	--Fertilizer Recipes
	{
		type = "recipe",
		name = "composting",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 20,
		ingredients = {
			{ "organic-material",40 },
			{type = "fluid", name = "water", amount = 20 },
		},
		results = {
			{ "fertilizer",40 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "c",
	},
	{
		type = "recipe",
		name = "stone-fertilizer",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 2.5,
		ingredients = {
			{ "stone",5 },
			{type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{ "fertilizer",6 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "c",
	},
	{
		type = "recipe",
		name = "stone-sulfur-fertilizer",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 2.5,
		ingredients = {
			{ "stone",5 },
			{ "sulfur",5 },
			{type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{ "fertilizer",14 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "c",
	},
	{
		type = "recipe",
		name = "stone-organic-fertilizer",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 2.5,
		ingredients = {
			{ "stone",5 },
			{ "organic-material",5 },
			{type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{ "fertilizer",14 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "c",
	},
	{
		type = "recipe",
		name = "fertilizer",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 2.5,
		ingredients = {
			{ "stone",5 },
			{ "sulfur",5 },
			{ "organic-material",5 },
			{type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{ "fertilizer",20 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "c",
	},
	{
		type = "recipe",
		name = "plant-oil-fertilizer",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 10,
		ingredients = {
			{type = "fluid", name = "plant-oil", amount = 5 },
			{type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{ "fertilizer",5 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Recycling",
		order = "c",
	},
})

local sewage_plant = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
sewage_plant.name = "sewage-treatment-plant"
sewage_plant.minable.result = "sewage-treatment-plant"
sewage_plant.crafting_categories = {"sewage-treatment"}

local sewage_plant_recipe = table.deepcopy(data.raw.recipe["chemical-plant"])
sewage_plant_recipe.name = "sewage-treatment-plant"
sewage_plant_recipe.subgroup = "Recycling"
sewage_plant_recipe.results = {{"sewage-treatment-plant",1}}

data:extend({sewage_plant, sewage_plant_recipe})

LSlib.technology.addRecipeUnlock("plastics", "plastic-recycling")
LSlib.technology.addRecipeUnlock("advanced-material-processing", "paper-recycling")
LSlib.technology.addRecipeUnlock("sulfur-processing", "stone-sulfur-fertilizer")
LSlib.technology.addRecipeUnlock("sulfur-processing", "fertilizer")


local wasteproductivity = { "stone-fertilizer", "stone-sulfur-fertilizer", "stone-organic-fertilizer", "fertilizer", "organic-material-gas" }

for km, vm in pairs(data.raw.module) do
  if vm.effect.productivity and vm.limitation then
	for _, recipe in ipairs(wasteproductivity) do
	  table.insert(vm.limitation, recipe)
	end
  end
end