local o = vim.o -- Options
local g = vim.g -- Global variables

-- Colorscheme
o.background = "dark"
vim.cmd([[colorscheme modus_vivendi]])

-- General options
o.number = true
o.relativenumber = true
o.numberwidth = 5
o.list = true
o.mouse = "a"
o.ignorecase = true
o.smartcase = true
o.scrolloff = 8
o.termguicolors = true
o.clipboard = "unnamedplus"
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
o.colorcolumn = "80"
o.completeopt = "menu,menuone,noselect"

-- Undo and backup
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.backupdir = "/tmp/"
o.undodir = "/tmp/"
o.directory = "/tmp/"
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

-- Netrw options
g.netrw_banner = 0

-- Experimental Lua module loader
vim.loader.enable()
