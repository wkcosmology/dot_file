imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-j>' 
snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<Cr>
