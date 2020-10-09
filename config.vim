"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

set nofoldenable
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set smartcase
set ignorecase
set visualbell
nmap ; :
vmap ; :
let mapleader=","
let maplocalleader = ","
set relativenumber
set number
set cursorline
" turn off gutentags while commiting
au FileType gitcommit,gitrebase let g:gutentags_enabled=0


" Persistent undo files
let vimDir = '$HOME/.vim'
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

"HARDCORE
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

nnoremap <pageup> <nop>
nnoremap <pagedown> <nop>
nnoremap <home> <nop>
nnoremap <end> <nop>

nnoremap <backspace> <nop>
nnoremap <tab> <nop>

nnoremap <del> <nop>

" neoformat
noremap <C-l> :ALEFix rubocop<CR>

let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_eslint_executable = 'eslint_d'

let g:ale_linters = {
	  \ 'go': ['gopls'],
	  \}

let g:lightline = {
  \ 'colorscheme': 'PaperColor'
\}

let g:lightline.component_function = {
      \   'gutentags': 'LightlineGutentags',
      \   'gitbranch': 'LightlineGitBranch',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

" lightline
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'absolutepath', 'modified' ],
    \           [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \           [ 'gitbranch' ]],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'gutentags' ],
    \          ]
    \ }
let g:lightline.inactive = {
    \ 'left': [ [ 'absolutepath' ], [ 'gitbranch' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

function! LightlineGutentags() abort
  return exists('b:gutentags_files') ? gutentags#statusline() : ''
endfunction

function! LightlineGitBranch() abort
    return FugitiveStatusline()
endfunction

set hidden

nnoremap <Leader>b :Buffers<cr>
nnoremap <leader>f :GFiles<cr>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let test#strategy = "dispatch"

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"EyeCandy
set termguicolors
colorscheme PaperColor
set background=light

set noshowmode

"golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_bin_path=expand("$HOME/bin/")
