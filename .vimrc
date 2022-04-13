" Default settings {{{1
runtime defaults.vim
set nocompatible
set backspace=indent,eol,start
set encoding=utf-8
set ffs=unix,dos,mac

" Einrückung, Tabulator
filetype plugin indent on
syntax on
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
silent! set breakindent
set formatoptions+=lor
set iskeyword-=_
set nrformats=
set lbr
set showbreak=**\ \

" Bedienung
set number
set cursorline
set showmode
set showcmd
set ruler
set laststatus=2
set wrap
set title
set scrolloff=7
set sidescrolloff=7
set sidescroll=1
set updatetime=250
set autoread
set autowrite       " Automatically save before commands like :next and :make
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.tif
set wildignore+=*.pdf,*.psd,*.xcf,*.dvi
set wildignore+=*.aux,*.lof,*.lot,*.fls,*.toc,*.fmt,*.fot,*.cb,*.cb2,.*.lb,*.out
set wildignore+=*.fdb_latexmk,*.synctex.gz
set wildignore+=node_modules/*,bower_components/*,site-packages/*
set lazyredraw
set splitright
set splitbelow
set hidden
set foldmethod=marker

" Suche
set incsearch
set ignorecase
set smartcase
set nohlsearch
" }}}1
" Theme settings {{{1
colorscheme PaperColor
if $GNOME_APPEARANCE == 'light'
    set background=light
else
    set background=dark
endif
" }}}
" Mappings {{{1
let mapleader = 's'
let maplocalleader = ','

nnoremap <Leader>m :set so=999<CR>
nnoremap <Leader>M :set so=0<CR>

nnoremap <Leader>er :e $MYVIMRC<CR>
nnoremap <Leader>sr :source $MYVIMRC<CR>

nnoremap <Down> gj
nnoremap <C-j> gj
nnoremap <Up> gk
nnoremap <C-k> gk
inoremap ii <Esc>$a
inoremap jk <Esc>
nnoremap + :

" edit files in the same directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
nmap <Leader>ew :e %%
nmap <Leader>es :sp %%
nmap <Leader>ev :vsp %%
nmap <Leader>et :tabe %%
" }}}
" enable local vimrc {{{1
let localfile = expand('~/.vimrc_local')
if filereadable(localfile)
    source localfile
endif
" }}}
