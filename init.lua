local packages = {
  "options",
  "keymaps",
  "ui",
  "packer",
  "lsp",
  "treesitter",
  "telescope",
}

local user = "dearch."

for _, package in ipairs(packages) do
  require(user .. package)
end

-- vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
