-- Set vim options
local set = vim.opt

-- Define background
set.background = 'dark'

-- Define tab options
set.tabstop = 3
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- Set encoding
set.encoding = 'utf-8'

-- Define editor options
set.laststatus = 2
set.wildmenu = true
set.number = true
set.title = true

-- Define search & undo options
set.hidden = true
set.history = 1000
set.undofile = true
set.undodir = '~/.vim/undodir'
set.undolevels = 1000

set.swapfile = false