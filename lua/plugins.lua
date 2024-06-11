-- Bootstrap plugin manager: lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = { -- Add plugins here!
  -- Editor appearance
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  "kyazdani42/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "goolord/alpha-nvim",
  "xiyaowong/transparent.nvim",

  -- QoL improvements
  "nvim-tree/nvim-tree.lua",
  "windwp/nvim-autopairs",
  "Darazaki/indent-o-matic",
  "phaazon/hop.nvim",
  "vladdoster/remember.nvim",
  "terrortylor/nvim-comment",
  "akinsho/toggleterm.nvim",

  -- Code highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- Autocomplete and LSP
  "neovim/nvim-lspconfig",
  "onsails/lspkind.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",

  -- Code snippets
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "L3MON4D3/LuaSnip",

  -- Git features
  "NeogitOrg/neogit",
  "lewis6991/gitsigns.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
