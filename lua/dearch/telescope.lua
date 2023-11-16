local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

local actions = require "telescope.actions"

telescope.setup ({
  defaults = {
	layout_strategy = "flex",
	layout_config = {
	  horizontal = {
		size = {
		  width = "90%",
		  height = "60%",
		},
	  },
	  vertical = {
		size = {
		  width = "90%",
		  height = "90%",
		},
	  },
	},
	mappings = {
	  i = {
		-- map actions.which_key to <C-h> (default: <C-/>)
		-- actions.which_key shows the mappings for your picker,
		-- e.g. git_{create, delete, ...}_branch for the git_branches picker
		["<C-h>"] = "which_key"
	  }
	}
  },
  pickers = {
  },
  extensions = {
	media_files = {
	  filetypes = {"png", "webp", "jpg", "jpeg"},
	  find_cmd = "rg"
	}
  }
})
