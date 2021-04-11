function! MyHop(mode)
    echohl Yellow
  if a:mode ==# 'char1'
        echo 'Search for 1 character:  '
        execute 'HopChar1'
        call feedkeys(':', 'nx')
    elseif a:mode ==# 'char2'
        echo 'Search for 2 characters:  '
        execute 'HopChar2'
        call feedkeys(':', 'nx')
    elseif a:mode ==# 'word'
        execute 'HopWord'
    elseif a:mode ==# 'line'
        execute 'HopLine'
    endif
  echohl None
endfunction

command MyHopChar1 :call MyHop('char1')
command MyHopChar2 :call MyHop('char2')
command MyHopWord :call MyHop('word')
command MyHopLine :call MyHop('line')
