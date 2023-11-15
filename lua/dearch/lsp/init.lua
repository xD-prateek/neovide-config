local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "dearch.lsp.mason"
require "dearch.lsp.rust"
require("dearch.lsp.handlers").setup()
