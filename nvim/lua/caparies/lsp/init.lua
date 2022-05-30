local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("caparies.lsp.lsp-installer")
require("caparies.lsp.handlers").setup()
require("caparies.lsp.null-ls")
