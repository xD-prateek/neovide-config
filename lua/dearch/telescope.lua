local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

local actions = require "telescope.actions"

telescope.setup ({
  defaults = {
	initial_mode = "normal",
	layout_strategy = "flex",
	layout_config = {
	  vertical = {
		size = {
		  width = 0.9,
		  height = 0.9,
		},
	  },
	},
  },
  extensions = {
	media_files = {
	  filetypes = {"png", "webp", "jpg", "jpeg"},
	  find_cmd = "rg"
	}
  },
})
