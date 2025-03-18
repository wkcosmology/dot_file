"lua << EOF
"require'hop'.setup()
"EOF
"function! MyHop(mode)
"  if a:mode ==# 'char1'
"        echo 'Search for 1 character:  '
"        execute 'silent HopChar1'
"    elseif a:mode ==# 'char2'
"        echo 'Search for 2 characters:  '
"        execute 'silent HopChar2'
"    elseif a:mode ==# 'word'
"        execute 'silent HopWord'
"    elseif a:mode ==# 'line'
"        echo 'Search Line:  '
"        execute 'silent HopLine'
"    endif
"    call feedkeys(':','nx')
"endfunction
"
"command MyHopChar1 :call MyHop('char1')
"command MyHopChar2 :call MyHop('char2')
"command MyHopWord :call MyHop('word')
"command MyHopLine :call MyHop('line')
