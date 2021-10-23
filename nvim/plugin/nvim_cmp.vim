
" This commands are for ADDITIONAL sources for each filetype
augroup NVIMCMPFT
  autocmd FileType tex lua require'cmp'.setup.buffer {
        \   sources = {
          \     { name = 'buffer' , keyword_length = 5, max_item_count = 8},
          \     { name = 'nvim_lsp' },
          \     { name = 'ultisnips' },
          \     },
          \   }
  autocmd FileType lua lua require'cmp'.setup.buffer {
        \   sources = {
          \     { name = 'nvim_lsp' },
          \     { name = 'nvim_lua' },
          \     { name = 'ultisnips' },
          \     { name = 'path' },
          \   },
          \ }
augroup END 
