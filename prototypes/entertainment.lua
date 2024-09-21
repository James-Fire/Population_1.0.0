local MathData = require("prototypes/Data Script")
local common = require("prototypes/common")

--Auxilliary buildings that support resting efforts, but are not required

--Entertainment products
data:extend({
	{
		type = "item",
		name = "beer",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Auxilliary",
		order = "a",
		stack_size = 5
	},
	{
		type = "recipe",
		name = "beer",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 600,
		ingredients = {
			{"grain", 400},
			{ type = "fluid", name = "water", amount = 1000 },
		},
		results = {
			{"beer", 400},
			{ type = "fluid", name = "sewage", amount = 600 },
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
			{"beer", 20},
			{ type = "fluid", name = "treated-water", amount = 200 },
		},
		results = {
			{"tired-person", 8},
			{ type = "fluid", name = "sewage", amount = 200 },
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
					{ position = { (MathData.HousingSize[1]/2), 0 } },
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

--[[Recreational entertainment, directly increases rest speed
data:extend({
	{
		type = "item",
		name = "entertainment-bar",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Auxilliary",
		place_result = "entertainment-bar",
		order = "a",
		stack_size = 5
	},
	{
		type = "recipe",
		name = "entertainment-bar",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.3 },
			{ MathData.StructuralResources[2], MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, 1) * 0.7 },
			{ MathData.ElectricalResources[1], MathData.CalcStructureCost(MathData.ElectricalBase, MathData.ElectricalScalar, 1) },
			{ MathData.MechanicalResources[1], MathData.CalcStructureCost(MathData.MechanicalBase, MathData.MechanicalScalar, 1) },
		},
		result = "entertainment-bar",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "a-1",
	},
})]]