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

-- Autocommand that reloads neovim whenever you save packer.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerSync
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
 -- Have packer manage itself
  use "wbthomason/packer.nvim"
  -- theme
  use "Shatur/neovim-ayu"

  -- autopairs
  use "windwp/nvim-autopairs"

  use "neovim/nvim-lspconfig"

  -- cmp
  use "hrsh7th/nvim-cmp"

  -- completion source:
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"

  -- snippet
  use "L3MON4D3/LuaSnip"

  -- highlight similar words
  use "RRethy/vim-illuminate"

  -- tree-sitter
  use {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
  }

  -- telescope
  use {
	"nvim-telescope/telescope.nvim",
	requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "nvim-telescope/telescope-media-files.nvim", "nvim-telescope/telescope-file-browser.nvim" }
  }

  -- comment
  use {
	"numToStr/Comment.nvim",
	config = function()
	  require('Comment').setup()
	end
  } 

  -- gitsigns
  use {
	"lewis6991/gitsigns.nvim",
	config = function()
	  require('gitsigns').setup()
	end
  }

  -- multi-cursor
  use "mg979/vim-visual-multi"

  if PACKER_BOOTSTRAP then
	require("packer").sync()
  end
end)
