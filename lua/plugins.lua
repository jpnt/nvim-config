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
  "goolord/alpha-nvim", -- Greeter screen
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
  { "vladdoster/remember.nvim", config = true },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = true
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = true
  },

  -- File system explorer
  {
    "stevearc/oil.nvim",
    tag = "stable",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
  },

  -- Code/Command runner
  {
    "ej-shafran/compile-mode.nvim",
    event = "VeryLazy",
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

  -- Grep
  "duane9/nvim-rg",

  -- Code highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    build = ":TSUpdate"
  },

  -- Fuzzy finder
  "camspiers/snap", -- Requires rg (ripgrep) and fzf

  -- Autocomplete and LSP
  "neovim/nvim-lspconfig",
  "onsails/lspkind.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require'lsp_signature'.setup(opts)
    end
  },

  -- Code snippets
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy"
  },

  -- Git features
  { "lewis6991/gitsigns.nvim", config = true },
  {
    "akinsho/git-conflict.nvim",
    tag = "v2.0.0",
    config = true
  },
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    config = true
  },

}

local opts = {}
require("lazy").setup(plugins, opts)
