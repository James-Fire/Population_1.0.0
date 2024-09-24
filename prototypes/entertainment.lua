local MathData = require("prototypes/Data Script")
local common = require("prototypes/common")

--Auxilliary buildings that support resting efforts, but are not required

--Entertainment products
data:extend({
	{
		type = "fluid",
		name = "beer",
		default_temperature = 15,
		max_temperature = 100,
		heat_capacity = "0.2KJ",
		base_color = {r=0, g=0.34, b=0.6},
		flow_color = {r=0.7, g=0.7, b=0.7},
		icon = "__Population__/graphics/icons/beer.png",
		icon_size = 64, icon_mipmaps = 4,
		order = "a[fluid]-a[water]"
	},
	{
		type = "recipe",
		name = "beer",
		category = "chemistry",
		enabled = true,
		energy_required = 300,
		ingredients = {
			{"grain", 400},
			{ type = "fluid", name = "treated-water", amount = 600 },
		},
		results = {
			{ type = "fluid", name = "beer", amount = 400 },
			{ type = "fluid", name = "sewage", amount = 200 },
		},
		main_product = "beer",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "bar-3",
	},
})

--Bar, makes people care less about meh stuff.
data:extend({
	{
		type = "recipe",
		name = "tolerance-bar-use",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "tolerance-bar",
		enabled = true,
		energy_required = 200,
		ingredients = {
			{"person", 8},
			{ type = "fluid", name = "beer", amount = 100 },
			{ type = "fluid", name = "treated-water", amount = 200 },
		},
		results = {
			{"tired-person", 8},
			{ type = "fluid", name = "sewage", amount = 250 },
			{ "garbage",64 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "bar-2",
	},
	{
		type = "item",
		name = "tolerance-bar",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Auxilliary",
		place_result = "tolerance-bar",
		order = "a",
		stack_size = 5
	},
	{
		type = "recipe",
		name = "tolerance-bar",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.3 },
			{ MathData.StructuralResources[2], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.7 },
			{ MathData.ElectricalResources[1], MathData.CalcStructureCost(MathData.ElectricalBase, MathData.ElectricalScalar, 1) },
			{ MathData.MechanicalResources[1], MathData.CalcStructureCost(MathData.MechanicalBase, MathData.MechanicalScalar, 1) },
		},
		result = "tolerance-bar",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "bar-1",
	},
	{
		type = "assembling-machine",
		name = "tolerance-bar",
		icon = "__Population__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "tolerance-bar"
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		selection_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile"},
		crafting_categories = {"tolerance-bar"},
		crafting_speed = 1,
		energy_usage = MathData.HousingEnergy[2],
		allowed_effects = {"speed", "consumption"},
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 30,
		},
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
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = -2,
				pipe_connections = {
					{ position = { (MathData.HousingSize[1]/2)+0.5, 1 } },
				}
			},
			{
				production_type = "input",
				pipe_picture = bulkypipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = -2,
				pipe_connections = {
					{ position = { (MathData.HousingSize[1]/2)+0.5, -1 } },
				}
			},
			{
				production_type = "output",
				pipe_picture = bulkypipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = 2,
				pipe_connections = {
					{ position = { -(MathData.HousingSize[1]/2)-0.5, 0 } },
				}
			},
		},
	},
})

--Theatre, directly increases rest speed
data:extend({
	{
		type = "recipe",
		name = "entertainment-theatre-use",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "entertainment-theatre",
		enabled = false,
		energy_required = 500,
		ingredients = {
			{"person", 24},
			{ "copper-plate", 120},
			{ type = "fluid", name = "treated-water", amount = 200 },
		},
		results = {
			{"tired-person", 24},
			{ "copper-plate", 600},
			{ type = "fluid", name = "sewage", amount = 250 },
			{ "garbage",120 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "bar-2",
	},
	{
		type = "item",
		name = "entertainment-theatre",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Auxilliary",
		place_result = "entertainment-theatre",
		order = "a",
		stack_size = 5
	},
	{
		type = "recipe",
		name = "entertainment-theatre",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.3 },
			{ MathData.StructuralResources[2], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.7 },
			{ MathData.ElectricalResources[1], MathData.CalcStructureCost(MathData.ElectricalBase, MathData.ElectricalScalar, 1) },
			{ MathData.MechanicalResources[1], MathData.CalcStructureCost(MathData.MechanicalBase, MathData.MechanicalScalar, 1) },
		},
		result = "entertainment-theatre",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "a-1",
	},
	{
		type = "assembling-machine",
		name = "entertainment-theatre",
		icon = "__Population__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "entertainment-theatre"
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		selection_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile"},
		crafting_categories = {"entertainment-theatre"},
		crafting_speed = 1,
		energy_usage = MathData.HousingEnergy[3],
		allowed_effects = {"speed", "consumption"},
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 15,
		},
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
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = -2,
				pipe_connections = {
					{ position = { (MathData.HousingSize[1]/2)+0.5, 0 } },
				}
			},
			{
				production_type = "output",
				pipe_picture = bulkypipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = 2,
				pipe_connections = {
					{ position = { -(MathData.HousingSize[1]/2)-0.5, 0 } },
				}
			},
		},
	},
})

LSlib.recipe.duplicate("entertainment-theatre-use", "entertainment-theatre-use-copper")
LSlib.recipe.duplicate("entertainment-theatre-use", "entertainment-theatre-use-paper")
LSlib.recipe.duplicate("entertainment-theatre-use", "entertainment-theatre-use-plastic")

LSlib.recipe.editResult("entertainment-theatre-use-copper", "copper-plate", "copper-recycling", 1 )
LSlib.recipe.editResult("entertainment-theatre-use-paper", "copper-plate", "paper-recycling", 1 )
LSlib.recipe.editResult("entertainment-theatre-use-plastic", "copper-plate", "plastic-recycling", 1 )

LSlib.recipe.editIngredient("entertainment-theatre-use-copper", "copper-plate", "copper-food-5", 1 )
LSlib.recipe.editIngredient("entertainment-theatre-use-paper", "copper-plate", "paper-food-5", 1 )
LSlib.recipe.editIngredient("entertainment-theatre-use-plastic", "copper-plate", "plastic-food-5", 1 )

LSlib.recipe.enable("entertainment-theatre-use-copper")
LSlib.recipe.enable("entertainment-theatre-use-paper")
LSlib.recipe.enable("entertainment-theatre-use-plastic")

--Arcade, directly increases rest speed
data:extend({
	{
		type = "recipe",
		name = "entertainment-arcade-use",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "entertainment-arcade",
		enabled = true,
		energy_required = 500,
		ingredients = {
			{"person", 4},
			{ "candy", 40},
			{ type = "fluid", name = "beer", amount = 100 },
			{ type = "fluid", name = "treated-water", amount = 100 },
		},
		results = {
			{"tired-person", 4},
			{ type = "fluid", name = "sewage", amount = 200 },
			{ "garbage",40 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "bar-2",
	},
	{
		type = "item",
		name = "entertainment-arcade",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Auxilliary",
		place_result = "entertainment-arcade",
		order = "a",
		stack_size = 5
	},
	{
		type = "recipe",
		name = "entertainment-arcade",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.3 },
			{ MathData.StructuralResources[2], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.7 },
			{ MathData.ElectricalResources[1], MathData.CalcStructureCost(MathData.ElectricalBase, MathData.ElectricalScalar, 1) },
			{ MathData.MechanicalResources[1], MathData.CalcStructureCost(MathData.MechanicalBase, MathData.MechanicalScalar, 1) },
		},
		result = "entertainment-arcade",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "a-1",
	},
	{
		type = "assembling-machine",
		name = "entertainment-arcade",
		icon = "__Population__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "entertainment-arcade"
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		selection_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile"},
		crafting_categories = {"entertainment-arcade"},
		crafting_speed = 1,
		energy_usage = MathData.HousingEnergy[5],
		allowed_effects = {"speed", "consumption"},
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 10,
		},
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
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = -2,
				pipe_connections = {
					{ position = { (MathData.HousingSize[1]/2)+0.5, 1 } },
				}
			},
			{
				production_type = "input",
				pipe_picture = bulkypipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = -2,
				pipe_connections = {
					{ position = { (MathData.HousingSize[1]/2)+0.5, -1 } },
				}
			},
			{
				production_type = "output",
				pipe_picture = bulkypipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1,
				base_level = 2,
				pipe_connections = {
					{ position = { -(MathData.HousingSize[1]/2)-0.5, 0 } },
				}
			},
		},
	},
})