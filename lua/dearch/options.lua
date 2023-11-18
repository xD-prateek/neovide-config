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
}


for k, v in pairs(options) do
vim.opt[k] = v
end

vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
