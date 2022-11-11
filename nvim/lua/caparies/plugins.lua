local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
   augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("kyazdani42/nvim-web-devicons")

  -- Nvim-tree
  --[[ use("kyazdani42/nvim-tree.lua") ]]

  -- Neo-tree
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
      },
    },
  })

  -- Winbar
  use("fgheng/winbar.nvim")
  -- need neovim v8

  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/toggleterm.nvim")
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
  use("folke/which-key.nvim")

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use("lunarvim/darkplus.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  --[[ use("williamboman/nvim-lsp-installer") -- simple to use language server installer ]]
  use("neovim/nvim-lspconfig") -- enable LSP
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-ui-select.nvim" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- Theme Dracular
  use({
    "dracula/vim",
    { name = "dracula" },
  })

  -- Theme Tokyo-night
  use("folke/tokyonight.nvim")

  -- Theme Tokyodark
  use("tiagovla/tokyodark.nvim")

  -- Theme catppuccin
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })

  -- Colorize plug
  use("norcalli/nvim-colorizer.lua")

  -- Rainbow-parentheses
  -- use("junegunn/rainbow_parentheses.vim")

  -- Multi Cursor
  use({
    "mg979/vim-visual-multi",
    { branch = "master" },
  })

  -- React-js
  use("mattn/emmet-vim")
  use("windwp/nvim-ts-autotag") -- Autotags for javascript, react
  -- use("styled-components/vim-styled-components", { branch = "main" })

  -- Java
  use("mfussenegger/nvim-jdtls")

  -- Session
  use("rmagatti/session-lens")
  use("rmagatti/auto-session")
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  -- Mysql
  use("nanotee/sqls.nvim")

  -- Notify
  use("rcarriga/nvim-notify")
  use("ryanoasis/vim-devicons")

  -- MakedownPreview for md
  use({ "iamcco/markdown-preview.nvim" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
