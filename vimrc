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

Plug 'elzr/vim-json'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/mru.vim'
if (has('python') || has('python3'))
    Plug 'SirVer/ultisnips'
else
    Plug 'garbas/vim-snipmate'
    Plug 'MarcWeber/vim-addon-mw-utils' "required for snipmate
    Plug 'tomtom/tlib_vim' "required for snipmate
endif
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'adah1972/vim-copy-as-rtf'
Plug 'habamax/vim-asciidoctor'

" color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jacoborus/tender.vim'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
" end colorschemes

"dev"
Plug 'tenzink/vim-fullscreen', { 'branch': 'noWin32' }

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
set scrolloff=5

" ================ Encoding ================

set encoding=utf-8
set fileencodings=utf-8,cp1251
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" ================ Custom keybindings ================

map <leader>L :Lines!<cr>
map <leader>ag :Ag<cr>
map <leader>b :BufExplorer<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>f :MRU<cr>
map <leader>l :Lines<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>o :Files<cr>
map <leader>rg :Rg<cr>

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


" ================ SnipMate ==========================
" 
let g:snipMate = { 'snippet_version' : 1 }

command!      -bang -nargs=* Rga
  \ call fzf#vim#grep("rga --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>),
  \ 1, fzf#vim#with_preview(), <bang>0)

" ================ AsciiDoctor =======================

let g:asciidoctor_fenced_languages = ['yaml', 'json']



" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>o :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>c :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    compiler asciidoctor2html
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END



" ================ Custom commands ===================

command CDC cd %:p:h

" ================ Colors ============================

set background=light

"colorscheme molokai
"colorscheme monokai
"colorscheme solarized
"colorscheme peacock
"colorscheme mud
"colorscheme seoul256
"colorscheme desert
colorscheme gruvbox
"colorscheme tender
"colorscheme atom-dark
"colorscheme OceanicNext
"colorscheme afterglow
