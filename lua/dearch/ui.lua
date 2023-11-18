vim.cmd "colorscheme embark"
-- else
  -- vim.cmd "colorscheme peachpuff"
-- end

if vim.g.neovide then
  vim.o.guifont = "Fira Code:h11:#h-none"
  vim.opt.linespace = 2

  vim.g.neovide_cursor_animation_length = 0.06
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_vfx_mode = "torpedo"
end
