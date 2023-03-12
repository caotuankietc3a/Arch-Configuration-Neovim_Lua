return {
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function() require("caparies.config.comment") end,
  },
  {
    "kevinhwang91/rnvimr",
    init = function() require("caparies.config.ranger") end,
  },

  "mg979/vim-visual-multi",

  {
    "filipdutescu/renamer.nvim",
    lazy = true,
    branch = "master",
    config = function() require("caparies.config.renamer") end,
  },

  "iamcco/markdown-preview.nvim",

  "moll/vim-bbye",

  {
    "rmagatti/auto-session",
    config = function() require("caparies.config.auto-session") end,
  },
  {
    "rmagatti/session-lens",
    config = function() require("caparies.config.session-lens") end,
  },
}
