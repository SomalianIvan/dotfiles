vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.api.nvim_exec(
[[
set nofoldenable
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set smartcase
set ignorecase
set visualbell
set termguicolors
colorscheme kanagawa " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
set background=dark
nmap ; :
vmap ; :
let mapleader=","
let maplocalleader = ","
set relativenumber
set number
set cursorline
" turn off gutentags while commiting
au FileType gitcommit,gitrebase let g:gutentags_enabled=0
let vimDir = '$HOME/.vim'
" Keep undo history across sessions by storing it in a file
filetype indent on

if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif
" status bar
" show current mode
set showmode
set statusline+=%F
:command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)
]],

true)
-- local everblush = require('everblush')
-- everblush.setup({ nvim_tree = { contrast = true } }) -- or use contrast = false to not apply contrast

