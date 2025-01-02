" " set numpy style for honza/vim-snippets
" let g:ultisnips_python_style = 'numpy'
" let g:UltiSnipsExpandTrigger = '<C-j>'
" let g:UltiSnipsJumpForwardTrigger = '<C-j>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" let g:snips_author = 'Kai Wang'
"
" let g:ultisnips_javascript = {
"      \ 'keyword-spacing': 'always',
"      \ 'semi': 'never',
"      \ 'space-before-function-paren': 'always',
"      \ }
"

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-j>'
