local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  print("Mason not found,")
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  print("mason-config not found.")
  return
end

local servers = {
  "clangd",
  "lua_ls",
  "rust_analyzer",
  "taplo",
  "tsserver",
  "pyright",
}

mason.setup({
  ui = {
	icons = {
			  package_installed = "◍",
			  package_pending = "➜",
			  package_uninstalled = "✗",
		  },
	border = "rounded",
	width = 0.7,
	height = 0.8,
  },
  max_concurrent_installers = 4,
})

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("dearch.lsp.handlers").on_attach,
		capabilities = require("dearch.lsp.handlers").capabilities,
	}

	local require_ok, conf_opts = pcall(require, "dearch.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
