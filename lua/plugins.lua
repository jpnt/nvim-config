vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Plugins here
  use 'wbthomason/packer.nvim'

  -- Gotta go fast
  use 'lewis6991/impatient.nvim'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Colorscheme
  use 'rafamadriz/neon'

  -- Automatically close pairs
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup {} end
  }

  -- File explorer tree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('nvim-tree').setup {} end
  }

  -- Language Server Protocol
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim' -- Symbols for completion
  use {
    'williamboman/mason.nvim', -- LSP installer
    config = function() require('mason').setup {} end
  }

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  -- Markdown file jumping support
  use {
    'jakewvincent/mkdnflow.nvim',
     config = function() require('mkdnflow').setup {} end
  }

  -- Automatic indentation
  use {
    'Darazaki/indent-o-matic',
    config = function() require('indent-o-matic').setup {} end
  }

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  -- Git decorations
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup {} end
  }

  -- Snippet engine
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'rafamadriz/friendly-snippets',
    config = function() require('luasnip.loaders.from_vscode').lazy_load() end
  }

  -- Rust lang
  use 'simrat39/rust-tools.nvim'

end)

