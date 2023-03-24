require("__LSlib__/LSlib")

empty_sprite = function()
	return {
		filename = "__core__/graphics/empty.png",
		priority = "extra-high",
		width = 1,
		height = 1,
		hr_version = {
			filename = "__core__/graphics/empty.png",
			priority = "extra-high",
			width = 1,
			height = 1,
		}
	}
end

set_shift =  function(shift, tab)
	tab.shift = shift
	if tab.hr_version then
		tab.hr_version.shift = shift
	end
	return tab
end

bulkypipepictures = function()
	local pipe_sprites = pipepictures()
	return {
  		north = set_shift(
  			{0, 1},
  			util.table
  			.deepcopy(pipe_sprites.straight_vertical)
		),
		south = empty_sprite(),
  		east = set_shift(
  			{-1, 0},
  			util.table
  			.deepcopy(pipe_sprites.straight_horizontal)
		),
  		west = set_shift(
  			{1, 0},
  			util.table
  			.deepcopy(pipe_sprites.straight_horizontal)
		)
	}
end

require("prototypes/item-groups")

require("prototypes/waste disposal")
require("prototypes/food")
require("prototypes/farming")
require("prototypes/housing")
require("prototypes/population")
require("prototypes/technology")
require("prototypes/Construction")