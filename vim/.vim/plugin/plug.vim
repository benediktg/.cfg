" load guard {{{1
if exists('g:loaded_plug_plugin')
    finish
endif
let g:loaded_plug_plugin = 1
" }}}1
" automatically install vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

call plug#begin('~/.vim/.vimplug')
" Cond function {{{1
function Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
" }}}

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'Quramy/vim-js-pretty-template'
Plug 'ajh17/VimCompletesMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'isa/vim-matchit'
Plug 'junegunn/gv.vim'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags', Cond(v:version >= 800)
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'w0rp/ale'
Plug 'xero/securemodelines'

Plug 'neoclide/coc.nvim', Cond(v:version >= 800, { 'do': { -> coc#util#install() } })
let g:coc_global_extensions = ['coc-json', 'coc-vimtex']

Plug 'NLKNguyen/papercolor-theme'

call plug#end()

colorscheme PaperColor
