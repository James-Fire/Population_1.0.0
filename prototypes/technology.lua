data:extend({
	{
		type = "technology",
		name = "biomass-processing",
		icon_size = 64,
		icon = "__base__/graphics/icons/steam-turbine.png",
		prerequisites = {"oil-processing"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "sewage-treatment-plant"
			},
			{
				type = "unlock-recipe",
				recipe = "sewage-treatment"
			},
			{
				type = "unlock-recipe",
				recipe = "organic-material-gas"
			},
			{
				type = "unlock-recipe",
				recipe = "organic-garbage-gas"
			},
			{
				type = "unlock-recipe",
				recipe = "plant-oil-gas"
			},
		},
		unit = {
			count = 50,
			ingredients = {
				{"automation-science-pack",1},
				{"logistic-science-pack",1}
			},
			time = 30,
		},
		order = "d-a",
	},
})

LSlib.technology.addRecipeUnlock("steel-processing", "low-rise")
LSlib.technology.addRecipeUnlock("advanced-material-processing-2", "garbage-recycling")
LSlib.technology.addRecipeUnlock("concrete", "ap-tower")
LSlib.technology.addRecipeUnlock("low-density-structure", "arcology-tower")