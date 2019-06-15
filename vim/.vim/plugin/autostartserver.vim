" load guard {{{1
if !empty(v:servername)
            \ || !exists('*remote_startserver')
            \ || exists('g:loaded_autostartserver_plugin')
            \ || $USER == 'root'
    finish
endif
let g:loaded_autostartsever_plugin = 1
" }}}1

call remote_startserver('VIM')
