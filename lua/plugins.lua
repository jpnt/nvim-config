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

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim' -- Symbols for completion
  use {
    'williamboman/nvim-lsp-installer',
    config = function() require('nvim-lsp-installer').setup {} end
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

  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'

end)

