return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() require("caparies.config.treesitter") end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function() require("caparies.config.autotags") end,
  },

  "nvim-treesitter/playground",

  "p00f/nvim-ts-rainbow",
}
