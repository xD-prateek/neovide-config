local status_ok, catppuccin = pcall(require, "catppuccin")

if status_ok then
	vim.cmd.colorscheme "catppuccin"
	catppuccin.setup({
		flavour = "mocha",
		transparent_background = true,
		dim_inactive = {
			enabled = true, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
	})
else
	vim.cmd.colorscheme "peachpuff"
end
-- vim.cmd "colorscheme embark"

-- set up lualine
local lualine_status_ok, lualine = pcall(require, "lualine")

if lualine_status_ok then
	local colors = {
		blue   = '#80a0ff',
		cyan   = '#79dac8',
		black  = '#080808',
		white  = '#c6c6c6',
		red    = '#ff5189',
		violet = '#d183e8',
		grey   = '#303030',
	}

	local bubbles_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.violet },
			b = { fg = colors.white, bg = colors.grey },
			c = { fg = colors.black, bg = colors.black },
		},

		insert = { a = { fg = colors.black, bg = colors.blue } },
		visual = { a = { fg = colors.black, bg = colors.cyan } },
		replace = { a = { fg = colors.black, bg = colors.red } },

		inactive = {

			a = { fg = colors.white, bg = colors.black },
			b = { fg = colors.white, bg = colors.black },
			c = { fg = colors.black, bg = colors.black },
		},
	}

	lualine.setup({
		options = {
			theme = bubbles_theme,
			component_separators = '|',
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = {
				{ 'mode', separator = { left = '' }, right_padding = 2 },
			},
			lualine_b = { 'filename', 'branch' },
			lualine_c = { 'fileformat' },
			lualine_x = {},
			lualine_y = { 'filetype', 'progress' },
			lualine_z = {
				{ 'location', separator = { right = '' }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { 'filename' },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'location' },
		},
		tabline = {},
		extensions = {},
	})
end

if vim.g.neovide then
	vim.o.guifont = "Fira Code:h11:#h-none"
	vim.opt.linespace = 2

	vim.g.neovide_cursor_animation_length = 0.06
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_vfx_mode = "torpedo"
end
