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
		place_result = "tolerance-bar",
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
			{"wheat", 400},
			{ type = "fluid", name = "water", amount = 1000 },
		},
		results = {
			{"beer", 400},
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "a-1",
	},
})

--Bar, makes people care less about meh stuff.
data:extend({
	{
		type = "recipe",
		name = "tolerance-bar",
		category = "tolerance-bar",
		enabled = true,
		energy_required = 5,
		ingredients = {
			{"person", 40},
		},
		results = {
			{"tired-person", 40},
		},
		--icon = "__Population__/graphics/crude-oil.png",
		--icon_size = 32,
		subgroup = "Auxilliary",
		order = "a-1",
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
		order = "a-1",
	},
})

--Recreational entertainment, directly increases rest speed
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
})