local MathData = require("prototypes/Data Script")
local common = require("prototypes/common")

--Auxilliary buildings that support resting efforts, but are not required. Max of 1 has an effect

--Entertainment products
data:extend({
	{
		type = "recipe",
		name = "butcher-meat",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "services-butcher",
		enabled = true,
		energy_required = 120,
		ingredients = {
			{"meat", 40},
			{ type = "fluid", name = "treated-water", amount = 120 },
			{"person", 4},
		},
		results = {
			{"tired-person", 4},
			{ type = "fluid", name = "sewage", amount = 120 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Services",
		order = "butcher-1",
	},
	{
		type = "recipe",
		name = "butcher-meat-water",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "services-butcher",
		enabled = true,
		energy_required = 120,
		ingredients = {
			{"meat", 40},
			{ type = "fluid", name = "treated-water", amount = 60 },
			{ type = "fluid", name = "water", amount = 60 },
			{"person", 4},
		},
		results = {
			{"tired-person", 4},
			{ type = "fluid", name = "sewage", amount = 120 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Services",
		order = "butcher-1",
	},
	{
		type = "recipe",
		name = "butcher-fish",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "services-butcher",
		enabled = true,
		energy_required = 120,
		ingredients = {
			{"raw-fish", 40},
			{ type = "fluid", name = "treated-water", amount = 120 },
			{"person", 4},
		},
		results = {
			{"tired-person", 4},
			{ type = "fluid", name = "sewage", amount = 120 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Services",
		order = "butcher-2",
	},
	{
		type = "recipe",
		name = "butcher-fish-water",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "services-butcher",
		enabled = true,
		energy_required = 120,
		ingredients = {
			{"raw-fish", 40},
			{ type = "fluid", name = "treated-water", amount = 60 },
			{ type = "fluid", name = "water", amount = 60 },
			{"person", 4},
		},
		results = {
			{"tired-person", 4},
			{ type = "fluid", name = "sewage", amount = 120 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Services",
		order = "butcher-2",
	},
	{
		type = "recipe",
		name = "butcher-meat-fish",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "services-butcher",
		enabled = true,
		energy_required = 150,
		ingredients = {
			{"meat", 25},
			{"raw-fish", 25},
			{ type = "fluid", name = "treated-water", amount = 150 },
			{"person", 4},
		},
		results = {
			{"tired-person", 4},
			{ type = "fluid", name = "sewage", amount = 150 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Services",
		order = "butcher-3",
	},
	{
		type = "recipe",
		name = "butcher-meat-fish-water",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		category = "services-butcher",
		enabled = true,
		energy_required = 150,
		ingredients = {
			{"meat", 25},
			{"raw-fish", 25},
			{ type = "fluid", name = "treated-water", amount = 75 },
			{ type = "fluid", name = "water", amount = 75 },
			{"person", 4},
		},
		results = {
			{"tired-person", 4},
			{ type = "fluid", name = "sewage", amount = 150 },
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Services",
		order = "butcher-3",
	},
})

--Butcher, takes meat and/or fish, improves rest speed.
data:extend({
	{
		type = "item",
		name = "services-butcher",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Services",
		place_result = "services-butcher",
		order = "a",
		stack_size = 5
	},
	{
		type = "recipe",
		name = "services-butcher",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1, true) * 0.5 },
			{ MathData.StructuralResources[2], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1, true) * 0.5 },
			{ MathData.ElectricalResources[1], MathData.CalcStructureCost(MathData.ElectricalBase, MathData.ElectricalScalar, 1, true) },
			{ MathData.MechanicalResources[2], MathData.CalcStructureCost(MathData.MechanicalBase, MathData.MechanicalScalar, 1, true) },
		},
		result = "services-butcher",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Services",
		order = "butcher-0",
	},
	{
		type = "assembling-machine",
		name = "services-butcher",
		icon = "__Population__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "services-butcher"
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		selection_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile"},
		crafting_categories = {"services-butcher"},
		crafting_speed = MathData.HousingWorkSpeed[1],
		energy_usage = MathData.HousingEnergy[1],
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
					{ position = { (MathData.HousingSize[1]/2), 1 } },
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
					{ position = { (MathData.HousingSize[1]/2), -1 } },
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
					{ position = { -(MathData.HousingSize[1]/2), 0 } },
				}
			},
		},
	},
})