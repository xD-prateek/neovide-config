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
	splitbelow = true,
	splitright = true,
	clipboard = "unnamedplus",
	ignorecase = true,
	numberwidth = 5,
	termguicolors = true,
}


for k, v in pairs(options) do
	vim.opt[k] = v
end
