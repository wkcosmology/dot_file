"scriptencoding utf-8
"let g:coc_global_extensions = [
"            \ 'coc-lists',
"            \ 'coc-clangd',
"            \ 'coc-html',
"            \ 'coc-yank',
"            \ 'coc-json',
"            \ 'coc-lua',
"            \ 'coc-vimlsp',
"            \ 'coc-jedi',
"            \ 'coc-snippets',
"            \ 'coc-explorer',
"            \ 'coc-tsserver',
"            \ 'coc-vimtex',
"            \ 'coc-html',
"            \ 'coc-lua',
"            \ 'coc-css',]

""coc normal config
"set hidden
"set nobackup
"set nowritebackup
"set updatetime=300
"set shortmess+=c
"set signcolumn=yes

"" manual trigger completion
"augroup coccompletion
"    autocmd!
"    autocmd BufEnter * inoremap <silent><expr> <c-space> coc#refresh()
"augroup END

"" let coc server begins 500ms after vim start
"let g:coc_start_at_startup=0
"function! CocTimerStart(timer)
"    exec 'CocStart'
"endfunction
"call timer_start(500,'CocTimerStart',{'repeat':1})

"" forbid coc for file size > 0.5MB
"let g:trigger_size = 0.5 * 1048576
"augroup hugefile
"    autocmd!
"    autocmd BufReadPre *
"                \ let size = getfsize(expand('<afile>')) |
"                \ if (size > g:trigger_size) || (size == -2) |
"                \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
"                \   exec 'CocDisable' |
"                \ else |
"                \   exec 'CocEnable' |
"                \ endif |
"                \ unlet size
"augroup END

"" scroll the pop-up window
"nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

"" config coc explorer
"let g:coc_explorer_global_presets = {
"\   'floatingRightside': {
"\     'reveal': 'current buffer',
"\     'position': 'floating',
"\     'floating-position': 'right-center',
"\     'floating-width': 60,
"\     'floating-height': &lines - 2,
"\   },
"\   'splitLeft': {
"\     'reveal': 'current buffer',
"\     'position': 'left',
"\     'floating-width': 60,
"\     'floating-height': &lines - 2,
"\     'toggle': v:false,
"\     'quit-on-open': v:false,
"\   },
"\ }
"augroup coc_explorer_number
"    autocmd!
"    autocmd FileType coc-explorer :set fillchars=eob:\  nu rnu
"augroup END
