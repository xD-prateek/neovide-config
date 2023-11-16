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
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', '<A-h>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<A-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))
end

nvim_tree.setup {
  on_attach = my_on_attach,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
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
--    mappings = {
--      list = {
--        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
--        { key = "h", cb = tree_cb "split" },
--        { key = "v", cb = tree_cb "vsplit" },
--      },
--    },
  },
}