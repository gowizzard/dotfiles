"Deactivate the vi
set nocompatible

"Define background & theme
set background=dark
colorscheme ghdark

"Define indention options
set autoindent

"Define search options
set hlsearch

"Define text rendering options
set encoding=utf-8
syntax enable

"Define interface options
set laststatus=2
set wildmenu
set number
set title
set cursorline

"Define miscellaneous options
set hidden
set history=1000
set scrolloff=5
set undofile
set undodir=$HOME/.vimundo
set undolevels=1000

"Define mapping
let mapleader=","
map <leader>y :%y+<cr>:%y<cr> 
