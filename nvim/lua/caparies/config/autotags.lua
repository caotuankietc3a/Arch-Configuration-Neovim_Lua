local status_ok, auto_pairs = pcall(require, "nvim-ts-autotag")
if not status_ok then return end

local filetypes = {
  "html",
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "svelte",
  "vue",
  "tsx",
  "jsx",
  "rescript",
  "xml",
  "php",
  "markdown",
  "glimmer",
  "handlebars",
  "hbs",
}

auto_pairs.setup({
  filetypes = filetypes,
})
