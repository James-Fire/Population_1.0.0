local MathData = require("prototypes/Data Script")

data:extend({
	--We can make a variety of farming products; Grains, Fruit, Vegetables, Animal Meat, Fish, Nuts, Fibre Crops, Wood
	--Different food types need to have a reason to exist. There should be at least 5, for that max benefit thing, but having more than that seems pointless currently.
	--Standard farming doesn't work for everything, obviously, but how to do that in-game?
	
	--Grain just grows, stacks nicely (Higher stack size), can be turned into feed
	--Fruit needs extra input water, can be turned into feed
	--Vegetables just grow, can be turned into feed
	--Meat needs more time, space, water, and input feed. Basically, it's very expensive to make, so should be the last thing you make, if at all. Also can't be sped up by fertilizer
	--Fish is fished
	--Nuts just grow. Can be processed into Oil, can be used for food
	--Wood grows, used to make paper, structural
	--Hemp just grows, used to make paper, feed, directly in meals, with water and stone to make bricks, Oil. Separates into fibers, foodstuff, and oil on processing.
	
	--From a variety of furnace farms, so they can ju st be given fertilizer and
	--use it without having to select that recipe and perhaps being blocked because there's none.
	--Fertilizer reduces growth time by 40%
	
	--At least 2 ingredients must be used, and a max of 5. Each ingedient above 2 reduces rest time by 5%
	
	--Farm Items
	{
		type = "item",
		name = "animal-feed",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 200
	},
	{
		type = "item",
		name = "grain",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 200
	},
	{
		type = "item",
		name = "fruit",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 100
	},
	{
		type = "item",
		name = "vegetables",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 100
	},
	{
		type = "item",
		name = "meat",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 50
	},
	{
		type = "item",
		name = "nuts",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 100
	},
	{
		type = "item",
		name = "hemp",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 100
	},
	{
		type = "item",
		name = "hemp-food",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 100
	},
	{
		type = "item",
		name = "hemp-fiber",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 200
	},
	{
		type = "fluid",
		name = "plant-oil",
		default_temperature = 15,
		max_temperature = 100,
		heat_capacity = "0.2KJ",
		base_color = {r=0.1, g=0.1, b=0.1},
		flow_color = {r=0.1, g=0.1, b=0.1},
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		fuel_value = "1.2MJ",
		order = "x[fluid]-a[water]",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
	},
	{
		type = "item",
		name = "paper",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 200
	},
	--Planet Oil recipes	
	{
		type = "recipe",
		name = "plant-oil-plastic",
		category = "chemistry",
		enabled = false,
		energy_required = 2,
		ingredients = {
			{type = "fluid", name = "plant-oil", amount = 20 },
		},
		results = {
			{ "plastic-bar",2 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		--subgroup = "Recycling",
		--order = "c",
	},
	--Farm Recipes
	{
		type = "recipe",
		name = "fruit-animal-feed",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 1,
		ingredients = {
			{ "fruit",1 },
			{ type = "fluid", name = "water", amount = 1 },
		},
		results = {
			{ "animal-feed",1 },
		},
		subgroup = "farming",
		order = "a-0",
	},
	{
		type = "recipe",
		name = "vegetables-animal-feed",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 1,
		ingredients = {
			{ "vegetables",1 },
			{ type = "fluid", name = "water", amount = 1 },
		},
		results = {
			{ "animal-feed",1 },
		},
		subgroup = "farming",
		order = "a-0",
	},
	{
		type = "recipe",
		name = "grain-animal-feed",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 1,
		ingredients = {
			{ "grain",1 },
			{ type = "fluid", name = "water", amount = 1 },
		},
		results = {
			{ "animal-feed",1 },
		},
		subgroup = "farming",
		order = "a-0",
	},
	{
		type = "recipe",
		name = "paper",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "wood",1 },
			{ type = "fluid", name = "water", amount = 10 },
		},
		results = {
			{ "paper",2 },
		},
		subgroup = "farming",
		order = "a-0",
	},
	{
		type = "recipe",
		name = "hemp-paper",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "hemp-fiber",1 },
			{ type = "fluid", name = "water", amount = 10 },
		},
		results = {
			{ "paper",2 },
		},
		subgroup = "farming",
		order = "a-5",
	},
	{
		type = "recipe",
		name = "hemp-procressing",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "hemp",5 },
			{ type = "fluid", name = "water", amount = 5 },
		},
		results = {
			{ "hemp-food",2 },
			{ "hemp-fiber",2 },
			{ type = "fluid", name = "plant-oil", amount = 2 },
		},
		subgroup = "farming",
		order = "b-0",
	},
	{
		type = "recipe",
		name = "nut-procressing",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ "nuts",5 },
		},
		results = {
			{ type = "fluid", name = "plant-oil", amount = 5 },
		},
		subgroup = "farming",
		order = "b-5",
	},
	{
		type = "recipe",
		name = "farming",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "farming",
		enabled = true,
		energy_required = 1,
		ingredients = {
		},
		results = {
			--{ "grain",1 },
		},
		subgroup = "farming",
		order = "b",
	},
	{
		type = "recipe",
		name = "fishing",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "fishing",
		enabled = true,
		energy_required = 20,
		ingredients = {
			{ "animal-feed", 5 }
		},
		results = {
			{ "raw-fish",5 },
		},
		subgroup = "farming",
		order = "a",
	},
	--Furnace farm for each item
	{
		type = "item",
		name = "farm",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 20,
		place_result = "farm",
	},
	{
		type = "item",
		name = "fishery",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "farming",
		order = "a",
		stack_size = 20,
		place_result = "fishery",
	},
	{
		type = "recipe",
		name = "fishery",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "crafting",
		enabled = true,
		energy_required = 10,
		ingredients = {
			{ "wood",10 },
		},
		results = {
			{ "fishery",1 },
		},
		subgroup = "farming-buildings",
		order = "a",
	},
	{
		type = "furnace",
		name = "farm",
		icon = "__Population__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "farm",
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-3,-3},{3,3}},
		selection_box = {{-3,-3},{3,3}},
		crafting_categories = {"farming"},
		crafting_speed = 1,
		energy_usage = "1kW",
		allowed_effects = {"speed"},
		energy_source = {
			type = "void",
			usage_priority = "secondary-input",
			emissions_per_minute = -2,
		},
		source_inventory_size = 1,
		result_inventory_size = 8,
		animation = {
			filename =
				"__Population__/graphics/entity/"
				.."gasifier.png",
			priority="high",
			width = 160,
			height = 160,
			frame_count = 1,
			shift = {1.5, -1.59375}
		},
		working_visualisations = {{
				animation = {
					filename =
						"__Population__/graphics/entity/"
						.."gasifier-fumes.png",
					priority = "extra-high",
					frame_count = 29,
					width = 48,
					height = 105,
					shift = {-0.05, -5.65},
					animation_speed = 0.5,
					scale = 1.5,
					run_mode="backward"
				}
		}},
		vehicle_impact_sound = {
		  filename = "__base__/sound/car-metal-impact.ogg",
		  volume = 0.65
		},
		working_sound = {
			sound = {
				filename = "__base__/sound/oil-refinery.ogg"
			},
			idle_sound = {
				filename = "__base__/sound/idle1.ogg", volume = 0.6
			},
			apparent_volume = 2,
		},
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = bulkypipepictures(),
				secondary_draw_orders = {
					north=-1,south=-1,east=-1,west=-1
				},
				pipe_covers = pipecoverspictures(),
				base_area = 2,
				base_level = -1,
				pipe_connections = {
				  { position = {0, -3.5} }
				}
			},
		},
	},{
		type = "furnace",
		name = "fishery",
		icon = "__Population__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "fishery",
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_mask = {"ground-tile"},
		collision_box = {{-3,-3},{3,3}},
		selection_box = {{-3,-3},{3,3}},
		crafting_categories = {"fishing"},
		crafting_speed = 0.1,
		energy_usage = "1kW",
		allowed_effects = {"speed"},
		energy_source = {
			type = "void",
			usage_priority = "secondary-input",
		},
		source_inventory_size = 1,
		result_inventory_size = 8,
		animation = {
			filename =
				"__Population__/graphics/entity/"
				.."gasifier.png",
			priority="high",
			width = 160,
			height = 160,
			frame_count = 1,
			shift = {1.5, -1.59375}
		},
		working_visualisations = {{
				animation = {
					filename =
						"__Population__/graphics/entity/"
						.."gasifier-fumes.png",
					priority = "extra-high",
					frame_count = 29,
					width = 48,
					height = 105,
					shift = {-0.05, -5.65},
					animation_speed = 0.5,
					scale = 1.5,
					run_mode="backward"
				}
		}},
		vehicle_impact_sound = {
		  filename = "__base__/sound/car-metal-impact.ogg",
		  volume = 0.65
		},
		working_sound = {
			sound = {
				filename = "__base__/sound/oil-refinery.ogg"
			},
			idle_sound = {
				filename = "__base__/sound/idle1.ogg", volume = 0.6
			},
			apparent_volume = 2,
		},
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = bulkypipepictures(),
				secondary_draw_orders = {
					north=-1,south=-1,east=-1,west=-1
				},
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				base_level = -1,
				pipe_connections = {
				  { position = {0, -3.5} }
				}
			},
		},
	},
})

local Farms = { "grain", "fruit", "vegetables", "meat", "nuts", "wood", "hemp" }
--"fish",
local FarmTime = { 160, 200, 120, 360, 120, 800, 40 }
local FarmProduce = { 30, 50, 30, 30, 30, 100, 20 }
local FarmRequiresWater = { false, true, false, true, false, false, false }

for i, Farm in pairs(Farms) do
	local FarmingIcons = {
			{
				icon = "__base__/graphics/icons/steam-turbine.png",
				icon_size = 64,
				scale = 1/2,
				shift = {16, -16},
			},
			{
				icon = "__base__/graphics/icons/steam-turbine.png",
				icon_size = 64,
			},
		},
	LSlib.recipe.duplicate("farming", Farm.."-farming")
	LSlib.recipe.setCraftingCategory(Farm.."-farming", Farm.."-farming")
	LSlib.recipe.addResult(Farm.."-farming", Farm, FarmProduce[i], "item")
	LSlib.recipe.setEnergyRequired(Farm.."-farming", FarmTime[i])
	if FarmRequiresWater[i] == true then
		LSlib.recipe.addIngredient(Farm.."-farming", "water", 3*FarmProduce[i], "fluid")
	else
		LSlib.recipe.addIngredient(Farm.."-farming", "water", FarmProduce[i], "fluid")
	end
	if Farm == "meat" then
		LSlib.recipe.addIngredient(Farm.."-farming", "animal-feed", FarmProduce[i], "item")
	else
		LSlib.recipe.duplicate(Farm.."-farming", "fertilizer-"..Farm.."-farming")
		LSlib.recipe.addIngredient("fertilizer-"..Farm.."-farming", "fertilizer", FarmProduce[i], "item")
		LSlib.recipe.editEnergyRequired("fertilizer-"..Farm.."-farming", 0.60)
		LSlib.recipe.setOrderstring("fertilizer-"..Farm.."-farming", "a")
		LSlib.recipe.changeIcons("fertilizer-"..Farm.."-farming", FarmingIcons, 64)
	end
	
	log("Non-fertilized farming recipe "..serpent.block(data.raw.recipe[Farm.."-farm"]))
	
	LSlib.recipe.duplicate("composting", Farm.."-composting")
	LSlib.recipe.editIngredient(Farm.."-composting", "organic-material", Farm, 1 )
	LSlib.recipe.editResult(Farm.."-composting", "fertilizer", "organic-material", 1 )
	
	local farmcopy = table.deepcopy(data.raw.furnace["farm"])
	farmcopy.name = Farm.."-farm"
	farmcopy.minable.result = Farm.."-farm"
	farmcopy.crafting_categories = {Farm.."-farming"}
	local farmitemcopy = table.deepcopy(data.raw.item["farm"])
	farmitemcopy.name = Farm.."-farm"
	farmitemcopy.place_result = Farm.."-farm"
	local farmrecipecopy = table.deepcopy(data.raw.recipe["fishery"])
	farmrecipecopy.name = Farm.."-farm"
	farmrecipecopy.results = { { Farm.."-farm",1 },	},
	data:extend({farmcopy,farmitemcopy,farmrecipecopy})
end

LSlib.recipe.duplicate("composting", "hemp-food-composting")
LSlib.recipe.editIngredient("hemp-food-composting", "organic-material", "hemp-food", 1 )
LSlib.recipe.editResult("hemp-food-composting", "fertilizer", "organic-material", 1 )

LSlib.recipe.duplicate("composting", "hemp-fiber-composting")
LSlib.recipe.editIngredient("hemp-fiber-composting", "organic-material", "hemp-fiber", 1 )
LSlib.recipe.editResult("hemp-fiber-composting", "fertilizer", "organic-material", 1 )

LSlib.recipe.disable("farming")
LSlib.recipe.disable("farm")
LSlib.technology.addRecipeUnlock("plastics", "plant-oil-plastic")