return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function() require("caparies.config.treesitter") end,
  },

  -- {
  --   "windwp/nvim-ts-autotag",
  --   config = function() require("caparies.config.autotags") end,
  -- },

  -- "nvim-treesitter/playground",

  {
    "p00f/nvim-ts-rainbow",
  },

  -- {
  --   "HiPhish/nvim-ts-rainbow2",
  --   event = "BufReadPost",
  -- },
}
