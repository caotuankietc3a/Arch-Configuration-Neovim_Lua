return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function() require("caparies.config.lsp") end,
  },

  -- cmdline tools and language servers manager (e.g. pyright)
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        -- border = "rounded",
        border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    },
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function() require("caparies.config.lsp.null-ls") end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "clang_format",
          "tidy",
          "yamlfmt",
          "autopep8",
          "stylish_haskell",
          "eslint",
          "yamllint",
        },
        automatic_setup = true,
      })
    end,
  },

  "mfussenegger/nvim-jdtls",
}
