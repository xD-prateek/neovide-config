local mason_status_ok, mason = pcall(require, "mason.nvim")
if not mason_status_ok then
  return
end

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
})
