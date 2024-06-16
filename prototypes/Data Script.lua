local MathData = { }

function MathData.round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.ceil(num * mult + 0.5) / mult
end

MathData.Bad_Building_List = { "assembling-machine", "furnace" }

MathData.RequiredWater = 10 --Water required for 1 rest period for 1 person
MathData.RestTime = 1000 --Rest time for 1 rest period
MathData.GrowthTime = 3 --time mult for 1 growth period, making or raising children
MathData.RestFood = 1 --How much food/packaging waste is used/made per rest period
MathData.RestPower = 120000 --How much energy is required for 1 rest period, in KJ
MathData.FoodVarietyScalar = 0.05 --How much each additional food ingredient improves rest speed, %

MathData.HousingName = {
	"sf-house",
	"mf-house",
	"low-rise",
	"ap-tower",
	"arcology-tower",
}
MathData.HousingCare = {
	["sf-house"] = 1,
	["mf-house"] = 0.9,
	["low-rise"] = 0.8,
	["ap-tower"] = 0.7,
	["arcology-tower"] = 0.6,
}
MathData.HousingPopRecipe = { --How many people each recipe level handles per run. Also how much food it needs, and how much garbage it makes
	2,
	8,
	20,
}
MathData.HousingPopChildren = { --How many children are made per recipe run
	MathData.HousingPopRecipe[1]/2,
	MathData.HousingPopRecipe[2]/2,
	MathData.HousingPopRecipe[3]/2,
}
MathData.HousingPopChildrenGrow = { --How many children are grown per recipe run
	MathData.HousingPopRecipe[1]*2,
	MathData.HousingPopRecipe[2]*2,
	MathData.HousingPopRecipe[3]*2,
}
MathData.HousingPopGrowRecipe = { --How much food growing recipes need, and how much garbage and recycling it makes
	MathData.HousingPopRecipe[1]+MathData.HousingPopChildrenGrow[1],
	MathData.HousingPopRecipe[2]+MathData.HousingPopChildrenGrow[2],
	MathData.HousingPopRecipe[3]+MathData.HousingPopChildrenGrow[3],
}
MathData.HousingPopReproRecipe = { --How much Food reproduction recipes need, and how much garbage and recycling it makes
	MathData.HousingPopRecipe[1]+MathData.HousingPopChildren[1],
	MathData.HousingPopRecipe[2]+MathData.HousingPopChildren[2],
	MathData.HousingPopRecipe[3]+MathData.HousingPopChildren[3],
}
MathData.HousingPopCapScalar = { --Multiply the working speed of each density by this much, so we can avoid very large people recipe numbers
	1,
	1,
	2,
	10,
	50,
}
MathData.HousingBaseRestSpeed = 1.2 --The base working speed of the lowest-density housing
MathData.DensityRestStep = 0.1 --How much each density step decreases rest speed
MathData.HousingWorkSpeed = { --Crafting Speed of each density
	(MathData.HousingBaseRestSpeed)*MathData.HousingPopCapScalar[1],
	(MathData.HousingBaseRestSpeed-MathData.DensityRestStep)*MathData.HousingPopCapScalar[2],
	(MathData.HousingBaseRestSpeed-2*MathData.DensityRestStep)*MathData.HousingPopCapScalar[3],
	(MathData.HousingBaseRestSpeed-3*MathData.DensityRestStep)*MathData.HousingPopCapScalar[4],
	(MathData.HousingBaseRestSpeed-4*MathData.DensityRestStep)*MathData.HousingPopCapScalar[5],
}
MathData.HousingPopRest = { --How many people each density level rests in a given rest cycle
	MathData.HousingPopRecipe[1]*MathData.HousingWorkSpeed[1],
	MathData.HousingPopRecipe[2]*MathData.HousingWorkSpeed[2],
	MathData.HousingPopRecipe[2]*MathData.HousingWorkSpeed[3],
	MathData.HousingPopRecipe[3]*MathData.HousingWorkSpeed[4],
	MathData.HousingPopRecipe[3]*MathData.HousingWorkSpeed[5],
}

MathData.PopPollution = 0.1 --How much pollution is produced per pop, per rest period.
MathData.DensityPollutionScalar = 0.75 --How much each density step reduces per-pop pollution
MathData.DensityEnergyScalar = 0.95 --How much each density step reduces per-pop energy usage

MathData.HousingPollution = { --How much pollution each density of housing makes
	MathData.HousingPopRest[1]*MathData.PopPollution,
	MathData.HousingPopRest[2]*MathData.PopPollution*MathData.DensityPollutionScalar,
	MathData.HousingPopRest[3]*MathData.PopPollution*MathData.DensityPollutionScalar^2,
	MathData.HousingPopRest[4]*MathData.PopPollution*MathData.DensityPollutionScalar^3,
	MathData.HousingPopRest[5]*MathData.PopPollution*MathData.DensityPollutionScalar^4,
}
MathData.HousingEnergy = { --How much energy each density of housing needs to work
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[1]*MathData.HousingPopCapScalar[1]).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[2]*MathData.HousingPopCapScalar[2]*MathData.DensityEnergyScalar).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[3]*MathData.HousingPopCapScalar[3]*MathData.DensityEnergyScalar^2).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[4]*MathData.HousingPopCapScalar[4]*MathData.DensityEnergyScalar^3).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[5]*MathData.HousingPopCapScalar[5]*MathData.DensityEnergyScalar^4).."W",
}
MathData.HousingSize = { --The side length, in tiles(Meters), of each housing structure
	5,
	10,
	10,
	20,
	20,
}
MathData.StructuralBase = { --Structural resources that are used per tile
	4,
	4,
	8,
	8,
	16,
}
MathData.StructuralScalar = { --Structural resources that are used per pop capacity
	4,
	4,
	2,
	1,
	0.5,
}
MathData.ElectricalBase = { --Electrical resources that are used per tile
	4,
	4,
	8,
	8,
	16,
}
MathData.ElectricalScalar = { --Electrical resources that are used per pop capacity
	4,
	4,
	2,
	1,
	0.5,
}
MathData.MechanicalBase = { --Mechanical resources that are used per tile
	1,
	1,
	2,
	2,
	4,
}
MathData.MechanicalScalar = { --Mechanical resources that are used per pop capacity
	4,
	2,
	2,
	1,
	1,
}

--Materials are abstracted away, to allow usage of a variety of different materials based on mods present.
MathData.StructuralResources = { --Resources that are used as structural support
    "basic-structural", --100%T1 and 100%T2 and 60%T3
    "steel-structural", --20%T3 and 20%T4 and 10%T5
    "stone-structural", --20%T3 and 80%T4 and 50%T5
    "skyscraper-structural", --40%T5
}
MathData.MechanicalResources = { --Resources that are used for mechanical purposes
	"basic-mechanical",
	"advanced-mechanical",
	"skyscraper-mechanical",
}
MathData.ElectricalResources = { --Resources that are used for electrical purposes
    "basic-electrical",
	"advanced-electrical",
}

function MathData.CalcStructureCost(BaseType,ScalarType,HouseIndex,IsNotHousing)
	local HousingCost = 0
	HousingCost = HousingCost + BaseType[HouseIndex]*MathData.HousingSize[HouseIndex]^2 --Base Cost for the structure
	if IsNotHousing then
		HousingCost = HousingCost + MathData.HousingPopRest[HouseIndex]*ScalarType[HouseIndex] --Scaled cost for the population capacity
	end
	HousingCost = MathData.round(HousingCost/10) --Make it reasonable, and round it.
	return HousingCost
end



MathData.HousingHeat = { --How much thermal energy each density of housing needs to work
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[1]*MathData.HousingPopCapScalar[1]+MathData.HousingSize[1]^2).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[2]*MathData.HousingPopCapScalar[2]*MathData.DensityEnergyScalar+MathData.HousingSize[2]^2*MathData.DensityEnergyScalar).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[3]*MathData.HousingPopCapScalar[3]*MathData.DensityEnergyScalar^2+MathData.HousingSize[2]^2*MathData.DensityEnergyScalar^2).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[4]*MathData.HousingPopCapScalar[4]*MathData.DensityEnergyScalar^3+MathData.HousingSize[2]^2*MathData.DensityEnergyScalar^3).."W",
	tostring(MathData.RestPower/MathData.RestTime*MathData.HousingPopRest[5]*MathData.HousingPopCapScalar[5]*MathData.DensityEnergyScalar^4+MathData.HousingSize[2]^2*MathData.DensityEnergyScalar^4).."W",
}
MathData.HousingHeatCapacity = { } --How much thermal energy each density of housing absorbs to increase temp. Divided by 4, because of the 4 beacons
for _, count in pairs({1,2,3,4,5}) do
	table.insert(MathData.HousingHeatCapacity,MathData.CalcStructureCost(MathData.StructuralBase, MathData.StructuralScalar, count).."MJ")
end

return MathData