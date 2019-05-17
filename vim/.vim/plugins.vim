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


function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction

Plug 'Quramy/vim-js-pretty-template'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'ajh17/VimCompletesMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'isa/vim-matchit'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'w0rp/ale'
Plug 'xero/securemodelines'

Plug 'altercation/vim-colors-solarized'
