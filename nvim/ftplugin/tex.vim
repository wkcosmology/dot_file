" config
setlocal wrap
setlocal linebreak
setlocal breakindent
setlocal textwidth=0
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal nolist
setlocal showbreak=↪\ 

nnoremap <buffer> <expr> j v:count ? 'j' : 'gj'
nnoremap <buffer> <expr> k v:count ? 'k' : 'gk'


" Better paragraph formatting when you *do* use gq
setlocal formatoptions+=t
setlocal formatoptions-=l

" Don't auto-continue comments
setlocal formatoptions-=r
setlocal formatoptions-=o

nnoremap <buffer> <expr> <C-d> (v:count ? v:count : 40) . 'gj'
nnoremap <buffer> <expr> <C-u> (v:count ? v:count : 40) . 'gk'
