let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set clipboard=unnamedplus

" Enable syntax highlighting
syntax enable
syntax on

" Set leader key to space
let mapleader=" "

" Map Ctrl+S to save
" Note: May need terminal config to allow Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <CR> :noh<CR><CR>

" Map leader+q to quit
nnoremap <leader>q :q<CR>

" Additional helpful settings
set number          " Show line numbers
set autoindent      " Auto-indent new lines
set smartindent     " Smart indent
set showmatch       " Show matching brackets
set ruler           " Show cursor position

" Better search settings
set hlsearch        " Highlight search results
set incsearch       " Incremental search
set ignorecase      " Ignore case when searching
set smartcase       " Smart case search

" Tab settings
set expandtab       " Use spaces instead of tabs
set tabstop=4       " Width of tab character
set shiftwidth=4    " Width of auto-indentation

" Better command-line completion
set wildmenu
set wildmode=longest:full,full

" System Clipboard Operations
" Copy entire buffer to system clipboard while preserving cursor position
nnoremap <leader>yy mzGVgg"+y`zzz

" Paste over selection without overwriting register
xnoremap <leader>p "_dP

" Register-Preserving Operations
" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Change without yanking
nnoremap <leader>c "_c
vnoremap <leader>c "_c
