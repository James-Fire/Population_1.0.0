--[[
Housing comes in 5 sizes
Single-Family, 1.2 Speed, 4x4, does up to 2 people at a time, 100% Pollution per person
Multi-Family, 1.1 Speed, 4x4, does up to 8 people at a time, 80% Pollution per person
Low-Rise, 2 Speed, 4x4, does up to 8 people at a time, 60% Pollution per person, Must build on concrete
Apartment Tower, 9 Speed, 6x6, does up to 20 people at a time, 40% Pollution per person, Must build on concrete
Arcology Tower, 40 Speed, 10x10, does up to 20 people at a time, 20% Pollution per person, Must build on concrete

Housing comes in 3 types: Spartan, Modest, Luxury
Higher types rest people faster, but take more resources.

Housing requires Copper (For Electrical), Structural Support (Wood, Steel, Concrete, LDS), Mechanical (Engine, Motor, Pipe), Circuits

Housing causes pollution per person. Higher Density housing causes less pollution per person.

Housing can be heated by either Electric or a District Heating system. Electric makes the building use more power.
District Heating makes it have a second entity that needs to be heated by heat pipes.

Housing structures get a calculated buff/nerf to their speed based on having trees, water, paths, and grass. These must be balanced, having too much is bad.


]]
local MathData = require("prototypes/Data Script")
local common = require("prototypes/common")

--Invisible beacons for Housing terrain impact
data:extend{
	{
		type = "beacon",
		name = "housing-beacon",
		energy_usage = "1W",
		flags = {
			"hide-alt-info",
			"not-blueprintable",
			"not-deconstructable",
			"placeable-off-grid",
			"not-on-map",
			"no-automated-item-removal",
			"no-automated-item-insertion"
		},
		collision_mask = {"resource-layer"}, -- disable collision
		resistances = {
			{
				type = "fire",
				percent = 90
			},
		},
		animation = common.blankAnimation,
		animation_shadow = common.blankAnimation,
		energy_source = {type = "void"},
		base_picture = common.blankPicture,
		supply_area_distance = 1,
		radius_visualisation_picture = common.blankPicture,
		distribution_effectivity = 1,
		module_specification = {
			module_slots = 65535,
		},
		allowed_effects = {"speed", "consumption", "pollution"},
		selection_box = {{0, 0}, {0, 0}},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
	},
	-- hidden speed modules
	{
		type = "module",
		name = "housing-positive-speed-module",
		icon = "__core__/graphics/empty.png",
		icon_size = 1,
		flags = {"hidden"},
		subgroup = "module",
		category = "speed",
		tier = 0,
		stack_size = 1,
		effect = {speed = {bonus = 0.01}, consumption = {bonus = 0.005}},
	},
	{
		type = "module",
		name = "housing-negative-speed-module",
		icon = "__core__/graphics/empty.png",
		icon_size = 1,
		flags = {"hidden"},
		subgroup = "module",
		category = "speed",
		tier = 0,
		stack_size = 1,
		effect = {speed = {bonus = -0.01}, consumption = {bonus = -0.005}},
	},
}

--Items
data:extend({
	{
		type = "item",
		name = "sf-house",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Housing",
		place_result = "sf-house",
		order = "a",
		stack_size = 5
	},
	{
		type = "item",
		name = "mf-house",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Housing",
		place_result = "mf-house",
		order = "b",
		stack_size = 3
	},
	{
		type = "item",
		name = "low-rise",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Housing",
		place_result = "low-rise",
		order = "c",
		stack_size = 2
	},
	{
		type = "item",
		name = "ap-tower",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Housing",
		place_result = "ap-tower",
		order = "d",
		stack_size = 1
	},
	{
		type = "item",
		name = "arcology-tower",
		icon = "__base__/graphics/icons/steam-turbine.png",
		icon_size = 64,
		subgroup = "Housing",
		place_result = "arcology-tower",
		order = "e",
		stack_size = 1
	},
})

--Recipes
data:extend({
	{
		type = "recipe",
		name = "sf-house",
		category = "crafting",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 1) },
			{ MathData.ElectricalResources[1], MathData.CalcHousingCost(MathData.ElectricalBase, MathData.ElectricalScalar, 1) },
			{ MathData.MechanicalResources[1], MathData.CalcHousingCost(MathData.MechanicalBase, MathData.MechanicalScalar, 1) },
		},
		result = "sf-house",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Housing",
		order = "a-1",
	},
	{
		type = "recipe",
		name = "mf-house",
		category = "crafting",
		enabled = true,
		energy_required = 20,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 2) },
			{ MathData.ElectricalResources[1], MathData.CalcHousingCost(MathData.ElectricalBase, MathData.ElectricalScalar, 2) },
			{ MathData.MechanicalResources[1], MathData.CalcHousingCost(MathData.MechanicalBase, MathData.MechanicalScalar, 2) },
		},
		result = "mf-house",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Housing",
		order = "b-1",
	},
	{
		type = "recipe",
		name = "low-rise",
		category = "advanced-crafting",
		enabled = false,
		energy_required = 100,
		ingredients = {
			{ MathData.StructuralResources[1], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 3)*0.6 },
			{ MathData.StructuralResources[2], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 3)*0.2 },
			{ MathData.StructuralResources[3], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 3)*0.2 },
			{ MathData.ElectricalResources[2], MathData.CalcHousingCost(MathData.ElectricalBase, MathData.ElectricalScalar, 3) },
			{ MathData.MechanicalResources[2], MathData.CalcHousingCost(MathData.MechanicalBase, MathData.MechanicalScalar, 3) },
		},
		result = "low-rise",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Housing",
		order = "c-1",
	},
	{
		type = "recipe",
		name = "ap-tower",
		category = "advanced-crafting",
		enabled = false,
		energy_required = 400,
		ingredients = {
			{ MathData.StructuralResources[2], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 4)*0.2 },
			{ MathData.StructuralResources[3], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 4)*0.8 },
			{ MathData.ElectricalResources[2], MathData.CalcHousingCost(MathData.ElectricalBase, MathData.ElectricalScalar, 4) },
			{ MathData.MechanicalResources[3], MathData.CalcHousingCost(MathData.MechanicalBase, MathData.MechanicalScalar, 4) },
		},
		result = "ap-tower",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Housing",
		order = "d-1",
	},
	{
		type = "recipe",
		name = "arcology-tower",
		category = "advanced-crafting",
		enabled = false,
		energy_required = 2000,
		ingredients = {
			{ MathData.StructuralResources[2], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 5)*0.1 },
			{ MathData.StructuralResources[3], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 5)*0.4 },
			{ MathData.StructuralResources[4], MathData.CalcHousingCost(MathData.StructuralBase, MathData.StructuralScalar, 5)*0.5 },
			{ MathData.ElectricalResources[2], MathData.CalcHousingCost(MathData.ElectricalBase, MathData.ElectricalScalar, 5) },
			{ MathData.MechanicalResources[3], MathData.CalcHousingCost(MathData.MechanicalBase, MathData.MechanicalScalar, 5) },
		},
		result = "arcology-tower",
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Housing",
		order = "e-1",
	},
})

--Entities
data:extend({
	{
		type = "assembling-machine",
		name = "sf-house",
		icon = "__Population__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "sf-house"
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		selection_box = {{-(MathData.HousingSize[1]/2), -(MathData.HousingSize[1]/2)}, {(MathData.HousingSize[1]/2), (MathData.HousingSize[1]/2)}},
		crafting_categories = {"pop-rest-1"},
		crafting_speed = MathData.HousingWorkSpeed[1],
		energy_usage = MathData.HousingEnergy[1],
		allowed_effects = {"speed", "consumption"},
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = MathData.HousingPollution[1],
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
				pipe_covers = pipecoverspictures(),
				base_area = 3,
				height = 1,
				base_level = -1,
				pipe_connections = {
				  { position = { (MathData.HousingSize[1]/2)-0.5, -(MathData.HousingSize[1]/2)-0.5 } },
				  { position = { (MathData.HousingSize[1]/2)-0.5, (MathData.HousingSize[1]/2)+0.5 } },
				}
			},
			{
				production_type = "output",
				pipe_picture = bulkypipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 3,
				height = 1,
				base_level = 1,
				pipe_connections = {
				  { position = { -(MathData.HousingSize[1]/2)+0.5, -(MathData.HousingSize[1]/2)-0.5} },
				  { position = { -(MathData.HousingSize[1]/2)+0.5, (MathData.HousingSize[1]/2)+0.5 } },
				}
			},
		},
	},
})

for _, count in pairs({2,3,4,5}) do
	local mf_house_entity = table.deepcopy(data.raw["assembling-machine"]["sf-house"])
	mf_house_entity.name = MathData.HousingName[count]
	mf_house_entity.minable.result = MathData.HousingName[count]
	mf_house_entity.energy_source.emissions_per_minute = MathData.HousingPollution[count]
	if count == 2 or count == 3 then
		mf_house_entity.crafting_categories = {"pop-rest-2"}
	elseif count == 4 or count == 5 then
		mf_house_entity.crafting_categories = {"pop-rest-3"}
	end
	mf_house_entity.crafting_speed = MathData.HousingWorkSpeed[count]
	mf_house_entity.energy_usage = MathData.HousingEnergy[count]
	mf_house_entity.collision_box = {{-(MathData.HousingSize[count]/2), -(MathData.HousingSize[count]/2)}, {(MathData.HousingSize[count]/2), (MathData.HousingSize[count]/2)}}
	mf_house_entity.selection_box = {{-(MathData.HousingSize[count]/2), -(MathData.HousingSize[count]/2)}, {(MathData.HousingSize[count]/2), (MathData.HousingSize[count]/2)}}
	local fluidboxArea = 3
	
	if count == 2 or count == 3 then
		fluidboxArea = 5
	elseif count == 4 or count == 5 then
		fluidboxArea = 10
	end
	mf_house_entity.fluid_boxes = {
		{
			production_type = "input",
			pipe_picture = bulkypipepictures(),
			pipe_covers = pipecoverspictures(),
			base_area = fluidboxArea,
			height = 1,
			base_level = -1,
			pipe_connections = {
			  { position = { (MathData.HousingSize[count]/2)-1.5, -(MathData.HousingSize[count]/2)-0.5 } },
			  { position = { (MathData.HousingSize[count]/2)-1.5, (MathData.HousingSize[count]/2)+0.5 } },
			}
		},
		{
			production_type = "output",
			pipe_picture = bulkypipepictures(),
			pipe_covers = pipecoverspictures(),
			base_area = fluidboxArea,
			height = 1,
			base_level = 1,
			pipe_connections = {
			  { position = { -(MathData.HousingSize[count]/2)+1.5, -(MathData.HousingSize[count]/2)-0.5} },
			  { position = { -(MathData.HousingSize[count]/2)+1.5, (MathData.HousingSize[count]/2)+0.5 } },
			}
		},
		--[[{
			production_type = "input",
			pipe_picture = bulkypipepictures(),
			pipe_covers = pipecoverspictures(),
			base_area = 1,
			base_level = -1,
			pipe_connections = {
				{ position = {0, -(MathData.HousingSize[count]/2)-0.5} }
			}
		},
		{
			production_type = "output",
			pipe_picture = bulkypipepictures(),
			pipe_covers = pipecoverspictures(),
			base_area = 1,
			base_level = 1,
			pipe_connections = { 
				{ position = {0, (MathData.HousingSize[count]/2)+0.5} }
			}
		}]]
	}
	if count == 2 or count == 3 then
		mf_house_entity.fast_replaceable_group = "T2-housing"
	elseif count == 4 or count == 5 then
		mf_house_entity.fast_replaceable_group = "T3-housing"
	end
	data:extend({mf_house_entity})
end
