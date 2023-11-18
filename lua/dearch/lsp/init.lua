local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "dearch.lsp.mason"
require "dearch.lsp.null-ls"
require("dearch.lsp.handlers").setup()
