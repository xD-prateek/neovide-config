local status_ok, catppuccin = pcall(require, "catppuccin")

if status_ok then
	vim.cmd.colorscheme "catppuccin"
	catppuccin.setup({
		flavour = "mocha",
		transparent_background = true,
		dim_inactive = {
			enabled = true,      -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15,   -- percentage of the shade to apply to the inactive window
		},
	})
else
	vim.cmd.colorscheme "peachpuff"
end
-- vim.cmd "colorscheme embark"

if vim.g.neovide then
	vim.o.guifont = "Fira Code:h11:#h-none"
	vim.opt.linespace = 2

	vim.g.neovide_cursor_animation_length = 0.06
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_vfx_mode = "torpedo"
end
