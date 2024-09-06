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
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  "goolord/alpha-nvim",
  "xiyaowong/transparent.nvim",
  {
    "sontungexpt/sttusline",
    branch = "table_version",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufEnter" },
    config = true,
  },

  -- QoL improvements
  "Darazaki/indent-o-matic",
  "terrortylor/nvim-comment",
  { "windwp/nvim-autopairs", config = true },
  { "vladdoster/remember.nvim", config = true },
  { "akinsho/toggleterm.nvim", config = true },

  -- File system tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- Code/Command runner
  {
    "ej-shafran/compile-mode.nvim",
    tag = "v5.2.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
      vim.g.compile_mode = {
        baleia_setup = true,
      }
    end
  },

  -- Code highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },

  -- Fuzzy finder
  "camspiers/snap",

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
  { "lewis6991/gitsigns.nvim", config = true },
  { "akinsho/git-conflict.nvim", tag = "v2.0.0", config = true },
  {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    config = true
  },

  -- Markdown editing
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
}

local opts = {}
require("lazy").setup(plugins, opts)
