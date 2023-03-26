data:extend({
	--Structure Items
	{
		type = "item",
		name = "basic-structural", --Basic wood framing
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Structural",
		order = "a",
		stack_size = 20
	},
	{
		type = "item",
		name = "steel-structural", --Wood, Steel, and Concrete
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Structural",
		order = "b",
		stack_size = 20
	},
	{
		type = "item",
		name = "stone-structural", --Slightly smaller skyscrapers still hard
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Structural",
		order = "c",
		stack_size = 20
	},
	{
		type = "item",
		name = "skyscraper-structural", --Skyscrapers hard
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Structural",
		order = "d",
		stack_size = 20
	},
	--Electrical Items
	{
		type = "item",
		name = "basic-electrical", --Small buildings require fairy simple wiring.
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Electrical",
		order = "a",
		stack_size = 20
	},
	{
		type = "item",
		name = "advanced-electrical", --Large towers require more complex wiring and electrical control systems.
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Electrical",
		order = "b",
		stack_size = 20
	},
	--Mechanical Items
	{
		type = "item",
		name = "basic-mechanical", --Just like... basic shit. Pipes and stuff.
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Mechanical",
		order = "a",
		stack_size = 20
	},
	{
		type = "item",
		name = "advanced-mechanical", --Medium buildings require slightly smaller dedicated mechanical systems
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Mechanical",
		order = "b",
		stack_size = 20
	},
	{
		type = "item",
		name = "skyscraper-mechanical", --Large buildings require dedicated mechanical systems
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Construction-Mechanical",
		order = "c",
		stack_size = 20
	},
	
	--Structural Recipes
	{
		type = "recipe",
		name = "basic-structural",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "wood", 5 },
			{ "iron-plate", 1 },
		},
		result = "basic-structural",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Structural",
		order = "a-1",
	},
	{
		type = "recipe",
		name = "steel-structural",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "wood", 1 },
			{ "steel-plate", 5 },
		},
		result = "steel-structural",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Structural",
		order = "a-2",
	},
	{
		type = "recipe",
		name = "stone-structural",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "steel-plate", 5 },
			{ "concrete", 10 },
		},
		result = "stone-structural",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Structural",
		order = "a-3",
	},
	{
		type = "recipe",
		name = "skyscraper-structural",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "low-density-structure", 10 },
			{ "steel-plate", 5 },
			{ "concrete", 5 },
		},
		result = "skyscraper-structural",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Structural",
		order = "a-4",
	},
	
	--Electrical Recipes
	{
		type = "recipe",
		name = "basic-electrical",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "iron-plate", 2 },
			{ "copper-cable", 10 },
			{ "electronic-circuit", 1 },
		},
		result = "basic-electrical",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Electrical",
		order = "a-1",
	},
	{
		type = "recipe",
		name = "advanced-electrical",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "iron-plate", 2 },
			{ "copper-cable", 20 },
			{ "electronic-circuit", 5 },
			{ "advanced-circuit", 2 },
		},
		result = "advanced-electrical",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Electrical",
		order = "a-2",
	},
	
	--Mechanical Recipes
	{
		type = "recipe",
		name = "basic-mechanical",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "pipe", 10 },
			{ "boiler", 1 },
		},
		result = "basic-mechanical",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Mechanical",
		order = "a-1",
	},
	{
		type = "recipe",
		name = "advanced-mechanical",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "pipe", 15 },
			{ "boiler", 1 },
			{ "pump", 1 },
		},
		result = "advanced-mechanical",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Mechanical",
		order = "a-2",
	},
	{
		type = "recipe",
		name = "skyscraper-mechanical",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "pipe", 30 },
			{ "boiler", 1 },
			{ "electric-engine-unit", 1 },
		},
		result = "skyscraper-mechanical",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Construction-Mechanical",
		order = "a-3",
	},
	
    --"pipe",
    --"engine-unit",
    --"electric-engine-unit",
})