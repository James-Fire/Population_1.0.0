--[[Add my recipe categories to the appropriate things
for name, assembler in pairs(data.raw["assembling-machine"]) do
	local categories = assembler.crafting_categories or {}
	if LSlib.utils.table.hasValue(categories, "crafting") and not LSlib.utils.table.hasValue(categories, "food-manufacture") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "food-manufacture")
	end
end]]

require("prototypes/science")