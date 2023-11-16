local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
	"git",
	"clone",
	"--depth",
	"1",
	"https://github.com/wbthomason/packer.nvim.git",
	install_path,
  }
end

-- Autocommand that reloads neovim whenever you save plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Check if packer is installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer couldn't be installed.")
  return
end

-- Packer in a separate window
packer.init {
  display = {
	open_fn = function()
	  return require("packer.util").float { border = "rounded" }
	end,
  },
}

-- Plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- completion source:
  use "hrsh7th/cmp-path"                              
  use "hrsh7th/cmp-buffer"                              
  use "hrsh7th/cmp-nvim-lua"                              
  use "hrsh7th/cmp-nvim-lsp"
  
  -- snippet 
  use 'hrsh7th/nvim-cmp' 
  use "L3MON4D3/LuaSnip"

  -- LSP completion
  use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"}
  use "neovim/nvim-lspconfig"

  -- themes
  use { "catppuccin/nvim", as = "catppuccin" }

  -- rust
  use { "rust-lang/rust.vim", "simrat39/rust-tools.nvim", ft = { "rust", "toml" } } -- Rust
  use {
	'saecki/crates.nvim',
	event = { "BufRead Cargo.toml" },
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
	  require('crates').setup()
	end
  }

  -- telescope
  use {
	'nvim-telescope/telescope.nvim',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- nvim-tree

use { "nvim-tree/nvim-tree.lua", "nvim-tree/nvim-web-devicons" }


  if PACKER_BOOTSTRAP then
	require("packer").sync()
  end
end)
