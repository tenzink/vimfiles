" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set backspace=indent,eol,start        "Allow backspace in insert mode
set noerrorbells visualbell t_vb=     " No sound & blinks
syntax on                             "turn on syntax highlighting

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Plugin Initialization ===============

call plug#begin('~/vimfiles/plugged')

Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/mru.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-scripts/bufexplorer.zip'
Plug 'elzr/vim-json'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'rust-lang/rust.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'

call plug#end()

" ================ Indentation ======================

set autoindent
set cindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Completion =======================
set wildmode=list:longest,full
set wildmenu

" ================ Other =====================

set nojoinspaces
set history=1000
set shortmess+=Ix
set showmatch

" ================ Search =====================

set hlsearch
set incsearch
set ignorecase
set smartcase

" ================ Encoding ================

set encoding=utf-8
set fileencodings=utf-8,cp1251
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" ================ Custom keybindings ================

map <leader>b :BufExplorer<cr>
map <leader>f :MRU<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>a :Ack<space>
map <leader>o :Files<cr>
map <leader>l :Lines<cr>
map <leader>L :Lines!<cr>

" ================ Status line =======================

set laststatus=2
set statusline=
set statusline+=%-3.3n\                     " buffer number
set statusline+=%F\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=%y                           " file type
set statusline+=[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=[%{&fileformat}]
set statusline+=%=                           " right align remainder
set statusline+=%o'0x%-8B                       " character value
set statusline+=%-14(%l:%c%V%)               " line, character
set statusline+=%<%P                         " file position

" ================ NERDTree ==========================

let NERDTreeNaturalSort=1
let NERDTreeWinPos="right"

" ================ Custom commands ===================

command CDC cd %:p:h

" ================ Colors ============================

"colorscheme molokai
"colorscheme monokai
"set background=light
"colorscheme solarized
"colorscheme peacock
"colorscheme mud
"colorscheme seoul256
"colorscheme desert
colorscheme gruvbox
"colorscheme tender
"colorscheme atom-dark
"colorscheme OceanicNext
