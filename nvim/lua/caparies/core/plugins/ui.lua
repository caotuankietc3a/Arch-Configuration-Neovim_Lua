return {
  {
    "rcarriga/nvim-notify",
    config = function() require("caparies.config.notify") end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function() require("caparies.config.neo-tree") end,
  },

  {
    "s1n7ax/nvim-window-picker",
    config = function() require("window-picker").setup() end,
  },

  {
    "akinsho/bufferline.nvim",
    config = function() require("caparies.config.bufferline") end,
  },

  {
    "fgheng/winbar.nvim",
    lazy = true,
    init = function() require("caparies.config.winbar") end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function() require("caparies.config.lualine") end,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function() require("caparies.config.toggleterm") end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function() require("caparies.config.indent-blankline") end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function() require("caparies.config.alpha") end,
  },

  -- {
  --   "glepnir/dashboard-nvim",
  --   lazy = false,
  --   event = "VimEnter",
  --   config = function() require("caparies.config.dashboard") end,
  -- },

  {
    "nvim-tree/nvim-web-devicons",
    -- config = function() require("caparies.config.nvim-web-devicons") end,
  },

  {
    "petertriho/nvim-scrollbar",
    config = function() require("caparies.config.scrollbar") end,
  },

  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require("caparies.config.barbecue") end,
  },

  {
    "folke/noice.nvim",
    lazy = true,
    config = function() require("caparies.config.noice") end,
  },

  {
    "echasnovski/mini.indentscope",
    lazy = true,
    enabled = true,
    -- lazy = true,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    -- event = "BufReadPre",
    opts = {
      symbol = "▏",
      -- symbol = "│",
      options = { try_as_border = false },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
        },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },

  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = true },
    },
    config = function() require("caparies.config.windows") end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function() require("caparies.config.colorizer") end,
  },
}
