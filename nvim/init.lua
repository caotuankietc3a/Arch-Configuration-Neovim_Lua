require("caparies.settings")
require("caparies.keymaps")
require("caparies.plugins")
require("caparies.colorscheme")
require("caparies.cmp")
require("caparies.lsp")
require("caparies.telescope")
require("caparies.treesitter")
require("caparies.autopairs")
require("caparies.comment")
require("caparies.gitsigns")
require("caparies.nvim-tree")
require("caparies.bufferline")
require("caparies.lualine")
require("caparies.toggleterm")
require("caparies.project")
require("caparies.impatient")
require("caparies.indentline")
require("caparies.alpha")
require("caparies.whichkey")
require("caparies.autocommands")
require("caparies.colorizer")
require("caparies.emet")
require("caparies.autotags")

-- Sessions
require("caparies.session-lens")
require("caparies.auto-session")

-- Complier
require("caparies.compiler")

-- .local/share/nvim/site/pack/packer/start/

if vim.fn.exists("g:vscode") ~= 0 then
	vim.cmd("source ~/.config/nvim/lua/caparies/vscode-keybindings/settings.vim")
end
