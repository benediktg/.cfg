nnoremap <buffer> <LocalLeader>b
      \ :<C-U>compiler bash<CR>

nnoremap <buffer> <LocalLeader>s
      \ :<C-U>compiler shellcheck<CR>

let b:undo_ftplugin .= '|setlocal makeprg< errorformat<'
      \ . '|nunmap <buffer> <LocalLeader>b'
      \ . '|nunmap <buffer> <LocalLeader>s'
