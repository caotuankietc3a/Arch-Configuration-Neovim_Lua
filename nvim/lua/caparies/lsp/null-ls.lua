local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]])
    end
  end,
  sources = {
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.prettier.with({ extra_args = {} }),
    formatting.stylua,
    --[[ formatting.google_java_format, ]]
    formatting.clang_format,
    formatting.tidy,
    formatting.yamlfmt,
    formatting.autopep8,
    formatting.stylish_haskell,
    --[[ diagnostics.flake8, ]]
    diagnostics.eslint,
    diagnostics.yamllint,
  },
})
