local options = {
	shiftwidth = 2,
	tabstop = 4,
	number = true,
	relativenumber = true,
	mouse = "a",
	smarttab = true,
	autoindent = true,
	softtabstop = 4,
	cursorline = true,
	titlestring = "dearch-NEOVIDE",
	title = true,
	splitbelow = true,
	splitright = true,
	clipboard = "unnamedplus",
	ignorecase = true,
	numberwidth = 5,
	termguicolors = true,
	textwidth = 0,
	linespace = 3,
	scrolloff = 5,
	mousemoveevent = true,
	signcolumn = "yes"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

if vim.g.neovide then
  vim.o.guifont = "Fira Code:h10"

  local neovide_options = {
	neovide_transparency = 0.9,
	neovide_scroll_animation_length = 0.2,
	neovide_hide_mouse_when_typing = true,
	neovide_theme = "dark",
	neovide_unlink_border_highlights = true,
	neovide_remember_window_size = true,
	neovide_cursor_animation_length = 0.06,
	neovide_cursor_trail_size = 0.7,
	neovide_cursor_unfocused_outline_width = 0.125,
	neovide_cursor_vfx_mode = "railgun",
	neovide_cursor_vfx_particle_density = 10.0,
  }

  for k, v in pairs(neovide_options) do
	vim.g[k] = v
  end
end
