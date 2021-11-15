scriptencoding utf-8
set cmdheight=1
syntax enable
set background=dark
set signcolumn=yes
set shortmess+=c
" Cursor column and line
set nocursorcolumn
set nocursorline
set noshowmode
set conceallevel=0
set termguicolors
set shiftwidth=4
" indetLine config
let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#777a54'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileType = ['python', 'c', 'cpp', 'h', 'hpp', 'html', 'css', 'javascript'] " conceallevel related
" edge config
" let g:edge_style = 'default'
" let g:edge_enable_italic = 0
" let g:edge_cursor = 'auto'
" let g:edge_menu_selection_background = 'blue'
" let g:edge_transparent_background = 1
" let g:edge_better_performance = 1
" let g:edge_diagnostic_text_highlight = 0
" colorscheme edge
" moonfly config
let g:moonflyTransparent = 1
let g:moonflyUndercurls = 0
colorscheme moonfly
highlight Visual guibg=#4A555A
" highlight Pmenu for auto completion
hi Pmenu ctermfg=251 ctermbg=235 guifg=#bab8b8 guibg=#363535
" Shougo/echodoc
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'signature'
" taboo
set sessionoptions+=tabpages,globals 
let g:taboo_tab_format=" \uf02b  %N. [Default%m] "
let g:taboo_renamed_tab_format=" \uf02b  %N. [%l%m] "
" undo tree
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 50
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
" scrolloff_fraction
let g:scrolloff_fraction = 0.15
" highligh current line number
hi! link CursorLineNr Constant
" tabline highlight
hi TabLineSel guibg=#191f24 guifg=#51b0ef
hi TabLine guibg=#191f24 guifg=#757574
" disable the comment italic
highlight Comment cterm=italic gui=italic
" highligh Comment cterm=none gui=none
" treesitter
hi! TSUnderline guibg=none gui=none
" highlight for matchup
" hi MatchWord guibg=white gui=NONE guifg=black
" hi MatchWordCur guibg=white gui=NONE guifg=black
" hi MatchParen guibg=white gui=NONE guifg=black
" hi MatchParenCur guibg=white gui=NONE guifg=black
" highligh hop
highlight HopNextKey guifg=#fcf908 gui=bold
highlight HopNextKey1 guifg=#0af1f5 gui=bold,underline
highlight HopNextKey2 guifg=#0af1f5 gui=bold,underline
highlight HopUnmatched guifg=#666666
" sign column and related (ale, gitgutter)
highlight SignColumn guibg=Normal
" highligh GitGutterAdd guibg=none guifg=#3efa3e
" highligh GitGutterChange guibg=none guifg=#64dffa
" highligh GitGutterDelete guibg=none guifg=#f07a84
" highligh GitGutterChangeDelete guibg=none guifg=#f07a84
" fzf highlight
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Normal'],
            \ 'prompt':  ['fg', 'Label'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
" for tmux blinking cursor: https://github.com/neovim/neovim/wiki/FAQ#flick-cursor-when-use-neovim-under-tmux
" hi EndOfBuffer ctermbg=NONE ctermfg=200 cterm=NONE
" hi Normal ctermbg=NONE ctermfg=200 cterm=NONE
