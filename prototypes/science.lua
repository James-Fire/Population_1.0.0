local energy_required = 40
local amount_param = 1
sciencepacks = {}
sciencepackrecipes = {}
--Get all the science packs
for i, prototype in pairs(data.raw.item) do
	if string.find(prototype.name, "science") then
		table.insert(sciencepacks, prototype)
	end
end


--Get all the science pack recipes
for i, prototype in pairs(data.raw.recipe) do
	if string.find(prototype.name, "science") and prototype.category == nil then
		table.insert(sciencepackrecipes, prototype)
	end
end
--[[Make a Data Card for each science pack
for i, SciencePack in pairs(sciencepacks) do
	LSlib.item.duplicate("item", SciencePack, SciencePack.."-data")
end]]
for i, Science in pairs(sciencepackrecipes) do
	--Add people to each science pack recipe, based on an exponent of how many packs it makes per recipe
	LSlib.recipe.addIngredient(Science.name, "person", 2*LSlib.recipe.getResultCount(Science.name, Science.name)*LSlib.recipe.getResultCount(Science.name, Science.name), "item")
	LSlib.recipe.addResult(Science.name, "tired-person", 2*LSlib.recipe.getResultCount(Science.name, Science.name)*LSlib.recipe.getResultCount(Science.name, Science.name), "item")
	LSlib.recipe.setMainResult(Science.name, Science.name)
	for km, vm in pairs(data.raw.module) do
		if vm.effect.productivity and vm.limitation then
			for n, Name in pairs(vm.limitation) do
				if Name == Science.name then
					table.remove(vm.limitation, n)
				end
			end
		end
	end
end

rocketrecipes = { "rocket-part", "satellite" }
for i, rocket in pairs(rocketrecipes) do
	local recipe = data.raw.recipe[rocket] 
	--Add people to each science pack recipe, based on an exponent of how many packs it makes per recipe
	LSlib.recipe.addResult(recipe.name, "tired-person", table_size(recipe.ingredients)^3, "item")
	LSlib.recipe.addIngredient(recipe.name, "person", table_size(recipe.ingredients)^3, "item")
	LSlib.recipe.setMainResult(recipe.name, recipe.name)
	for km, vm in pairs(data.raw.module) do
		if vm.effect.productivity and vm.limitation then
			for n, Name in pairs(vm.limitation) do
				if Name == recipe.name then
					table.remove(vm.limitation, n)
				end
			end
		end
	end
end