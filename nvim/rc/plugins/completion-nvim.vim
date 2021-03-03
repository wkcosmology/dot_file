" for completion-nvim
set completeopt=menuone,noinsert,noselect
set shortmess+=c
imap <silent> <c-space> <Plug>(completion_trigger)
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_hover = 0
let g:completion_enable_auto_signature = 0
let g:completion_matching_strategy_list = ['exact', 'fuzzy']
let g:completion_trigger_keyword_length = 2
let g:completion_sorting = 'alphabet'
let g:completion_abbr_length = 60
let g:completion_menu_length = 10
