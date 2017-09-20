set nocompatible

set tabstop=2
set shiftwidth=2
set smarttab
set et

set autoindent
set cindent

set showmatch
set hlsearch
set incsearch
set ignorecase

set wildmenu

set noerrorbells visualbell t_vb=

syntax on

:let mapleader = ","
map <leader>o :BufExplorer<cr>
map <leader>f :MRU<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

call plug#begin('~/vimfiles/plugged')

Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/mru.vim', { 'on': 'MRU' }
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/bufexplorer.zip'

call plug#end()
