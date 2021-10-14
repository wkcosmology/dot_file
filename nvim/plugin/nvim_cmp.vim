autocmd FileType tex lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'buffer' },
\     { name = 'nvim_lsp' },
\     { name = 'ultisnips' },
\     { name = 'latex_symbols' },
\   },
\ }
