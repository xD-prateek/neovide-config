local status_ok, ayu = pcall(require, "ayu")

if status_ok then
  ayu.setup({
	overrides = {
	  CursorLine = { bg = "#242424" },
	  LineNr = { fg = "#5e582b" },
	  Visual = { bg = "#523a25" },
	},
  })
  vim.cmd.colorscheme "ayu-dark"
else
  vim.cmd.colorscheme "peachpuff"
end
