" Put the color scheme on the top!!!
syntax enable
set background=dark
set signcolumn=yes
set shortmess+=c
" Cursor column and line
set nocursorcolumn
set noshowmode
set conceallevel=0
set termguicolors
set shiftwidth=4
" indetLine config
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['tex', 'json'] " conceallevel related
" edge config
let g:edge_style = 'neon'
let g:edge_enable_italic = 0
let g:edge_cursor = 'auto'
let g:edge_menu_selection_background = 'blue'
let g:edge_transparent_background = 1
let g:edge_better_performance = 1

" put color scheme before any highlight
colorscheme edge

" highligh current line number
hi! link CursorLineNr Title
" tabline highlight
hi TabLineSel guibg=#51afef guifg=#23272e
hi TabLine guibg=#5B6268 guifg=#23272e
" make the comment italic
highlight Comment cterm=italic gui=italic
" treesitter
hi! TSUnderline guibg=none gui=none
" highlight for matchup
hi MatchWord guibg=#424040 gui=NONE
hi MatchWordCur guibg=#424040 gui=NONE
hi MatchParen guibg=#828385 gui=NONE
hi MatchParenCur guibg=#828385 gui=NONE
" highligh hop
highlight HopNextKey guifg=#fcf908 gui=bold
highlight HopNextKey1 guifg=#0af1f5 gui=bold,underline
highlight HopNextKey2 guifg=#0af1f5 gui=bold,underline
highlight HopUnmatched guifg=#666666
" sign column and related (ale, gitgutter)
highlight SignColumn guibg=Normal
highligh ALEErrorSign guibg=none guifg=Red
highligh ALEWarningSign guibg=none guifg=Yellow
highligh GitGutterAdd guibg=none guifg=#3efa3e
highligh GitGutterChange guibg=none guifg=#64dffa
highligh GitGutterDelete guibg=none guifg=#f07a84
highligh GitGutterChangeDelete guibg=none guifg=#f07a84
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
