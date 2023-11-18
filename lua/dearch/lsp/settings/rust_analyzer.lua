return {
  require'lspconfig'.rust_analyzer.setup{
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
	settings = {
	  ['rust-analyzer'] = {
		diagnostics = {
		  enable = true;
		}
	  }
	}
  }
}
