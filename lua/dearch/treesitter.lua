vim.cmd [[
augroup treesitter_dearch_config
autocmd!
autocmd BufWritePost treesitter.lua source <afile> | TSUpdate
augroup end
]]

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup{
  ensure_installed = { "lua", "python", "c", "cpp", "csv", "git_config", "html", "java", "json", "rust", "scss", "toml", "typescript" },
  highlight = {
	enable = true,
  },
  autopairs = {
	enable = true,
  },
  indent = {
	enable = true,
  },
  context_commentstring = {
	enable = true,
	enable_autocmd = false,
  }
}
