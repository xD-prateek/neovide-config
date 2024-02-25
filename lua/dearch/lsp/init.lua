local cmp_status, cmp = pcall(require, "dearch.lsp.cmp")
if not cmp_status then
  print("cmp not loaded")
end

local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

local handler_status, handler = pcall(require, "dearch.lsp.lsp_handler")

if not handler_status then
  return
end

local servers = {
  "rust_analyzer",
}

handler.setup()

for _, server in pairs(servers) do
  opts = {
  on_attach =  handler.on_attach,
  capabilities = handler.capabilities,
  }
	local require_ok, conf_opts = pcall(require, "dearch.lsp.servers." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	lspconfig[server].setup(opts)
end
