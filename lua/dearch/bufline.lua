local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
	close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
	right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
	left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
	middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
	indicator_icon = nil,
	indicator = { style = "underline"},
	-- separator_style = "slope",
	buffer_close_icon = '',
	modified_icon = "●",
	close_icon = "",
	left_trunc_marker = "",
	right_trunc_marker = "",
	max_name_length = 30,
	max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
	tab_size = 21,
	offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 0 } },
	show_buffer_icons = true,
	show_buffer_close_icons = true,
	show_close_icon = true,
	show_tab_indicators = true,
	persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
	hover = {
	  enabled = true,
	  delay = 0,
	  reveal = {"close"},
	},
	enforce_regular_tabs = true,
	always_show_bufferline = false,
	diagnostics = "nvim_lsp",
  },
  highlights = {
	close_button = {
	  fg = "#eb6f92",
	},
	close_button_visible = {
	  fg = "#eb6f92",
	},
	close_button_selected = {
	  fg = "#eb6f92",
	},
	buffer_selected = {
	  bold = true,
	  italic = false,
	  -- underline = false,
	},
	buffer_visible = {
	  -- underline = false,
	},
  },
}
