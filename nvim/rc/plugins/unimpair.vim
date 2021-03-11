" unimpair
" This is a substitution of https://github.com/tpope/vim-unimpaired
" where this plugin is consuming my start up time
fun s:cnt_cmd(cmd)
  if v:count1 == 1
    execute ':' . a:cmd
  else
    execute ':' . v:count1 . a:cmd
  end
endf
nnoremap <silent> [q :<C-u>call <SID>cnt_cmd('cprevious')<cr>
nnoremap <silent> ]q :<C-u>call <SID>cnt_cmd('cnext')<cr>
nnoremap <silent> [Q :cfirst<cr>
nnoremap <silent> ]Q :clast<cr>
nnoremap <silent> [b :<C-u>call <SID>cnt_cmd('bprevious')<cr>
nnoremap <silent> ]b :<C-u>call <SID>cnt_cmd('bnext')<cr>
nnoremap <silent> [B :bfirst<cr>
nnoremap <silent> ]B :blast<cr>
nnoremap <silent> [l :<C-u>call <SID>cnt_cmd('lprevious')<cr>
nnoremap <silent> ]l :<C-u>call <SID>cnt_cmd('lnext')<cr>
nnoremap <silent> [L :lfirst<cr>
nnoremap <silent> ]L :llast<cr>
nnoremap <silent> [t :<C-u>call <SID>cnt_cmd('tabprevious')<cr>
nnoremap <silent> ]t :<C-u>call <SID>cnt_cmd('tabnext')<cr>
nnoremap <silent> [T :tabfirst<cr>
nnoremap <silent> ]T :tablast<cr>
nnoremap <expr> [<space> 'm`' . v:count1 . 'O<Esc>``'
nnoremap <expr> ]<space> 'm`' . v:count1 . 'o<Esc>``'
