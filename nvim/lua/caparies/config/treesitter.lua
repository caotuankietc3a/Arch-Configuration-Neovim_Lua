local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup({
  ensure_installed = {
    "bash",
    "help",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "tsx",
    "typescript",
    "vim",
    "yaml",
    "php",
    "java",
    "cpp",
    "c",
  },
  highlight = { enable = true },
  indent = { enable = true, disable = { "yaml", "python", "html" } },
  context_commentstring = { enable = true },
  rainbow = {
    enable = true,
    query = "rainbow-parens",
    disable = { "jsx", "html" },
  },
})
