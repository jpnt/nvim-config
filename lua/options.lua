local o = vim.o
local g = vim.g

-- General options
o.number = true
o.relativenumber = true
o.numberwidth = 5
o.list = true
o.mouse = 'a'
o.ignorecase = true
o.smartcase = true
o.scrolloff = 8
o.termguicolors = true
o.clipboard = 'unnamedplus'
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
o.colorcolumn = '80'
o.completeopt = 'menu,menuone,noselect'
o.background = 'dark'

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.backupdir = '/tmp/'
o.undodir = '/tmp/'
o.directory = '/tmp/'
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Map <leader> to space
g.mapleader = ''
g.maplocalleader = ''

-- Netrw options
g.netrw_banner = 0

-- Colorscheme
local ok, _ = pcall(vim.cmd, 'colorscheme neon')
if not ok then
  vim.cmd 'colorscheme default' -- If not installed, set colorscheme to default
end
