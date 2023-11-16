local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
--   return
-- end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
	return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
  -- vim.keymap.set('n', '<Tab>', api.node.open.preview(), opts('Open Preview'))
  -- vim.keymap.set('n', '<C-t>', api.node.open.tab(), opts('New Tab'))
  -- vim.keymap.set('n', '<C-h>', api.node.open.horizontal(), opts('Open: Horizontal Split'))
  -- vim.keymap.set('n', '<C-v>', api.node.open.vertical(), opts('Open: Vertical Split'))
  -- vim.keymap.set('n', '>', api.node.navigate.sibling.next(), opts('Next Sibling'))
  -- vim.keymap.set('n', '<', api.node.navigate.sibling.prev(), opts('Previous Sibling'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))
end

nvim_tree.setup {
  on_attach = my_on_attach,
  update_focused_file = {
	enable = true,
	update_cwd = true,
  },
  disable_netrw = false,
  renderer = {
	root_folder_modifier = ":~:s?$?/..?",
	icons = {
	  git_placement = "after",
	  glyphs = {
		default = "",
		symlink = "",
		folder = {
		  arrow_open = "",
		  arrow_closed = "",
		  default = "",
		  open = "",
		  empty = "",
		  empty_open = "",
		  symlink = "",
		  symlink_open = "",
		},
		git = {
		  unstaged = "",
		  staged = "S",
		  unmerged = "",
		  renamed = "➜",
		  untracked = "U",
		  deleted = "",
		  ignored = "◌",
		},
	  },
	},
  },
  diagnostics = {
	enable = true,
	show_on_dirs = true,
	icons = {
	  hint = "",
	  info = "",
	  warning = "",
	  error = "",
	},
  },
  open_on_tab = false,
  view = {
	width = 30,
	side = "left",
  },
  filters = {
	dotfiles = true,
  },
}
