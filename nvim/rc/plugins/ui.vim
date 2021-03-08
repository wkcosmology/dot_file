" Put the color scheme on the top!!!
syntax enable
set background=dark
set signcolumn=yes
set shortmess+=c
" let g:gruvbox_italic=1
" let g:gruvbox_invert_selection=0
" colorscheme gruvbox
let g:edge_style = 'neon'
let g:edge_enable_italic = 0
let g:edge_cursor = 'auto'
let g:edge_menu_selection_background = 'blue'
let g:edge_transparent_background = 1
colorscheme edge
" let g:gruvbox_contrast_dark='soft'
" let g:gruvbox_italicize_comments=1
" let g:gruvbox_transparent_bg=1

" Cursor column and line
set nocursorcolumn
hi! link CursorLineNr Title
set noshowmode
set conceallevel=0
set termguicolors
set shiftwidth=4

" indetLine config
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['tex', 'json'] " conceallevel related

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

" To enable transparent background in vim
augroup TranspBg
    autocmd!
    autocmd VimEnter * hi Normal guibg=none
    autocmd VimEnter * hi NormalFloat guibg=none
    autocmd VimEnter * hi EndOfBuffer guibg=none
augroup END

" hop highlight
" highlight HopNextKey guifg=#eaed47 gui=bold,underline
" highlight HopNextKey1 guifg=#00dfff gui=bold,underline
" highlight HopNextKey2 guifg=#5fa1ba gui=bold,underline
" highlight HopUnmatched guifg=#f5f2f2
highlight HopNextKey guifg=#fcf908 gui=bold
highlight HopNextKey1 guifg=#4af53b gui=bold,underline
highlight HopNextKey2 guifg=#4af53b gui=bold,underline
highlight HopUnmatched guifg=#f5f2f2

" sign column and related (ale, gitgutter)
highlight SignColumn guibg=Normal
highligh ALEErrorSign guibg=none guifg=Red
highligh ALEWarningSign guibg=none guifg=Yellow
highligh GitGutterAdd guibg=none guifg=LightGreen
highligh GitGutterChange guibg=none guifg=LightBlue
highligh GitGutterDelete guibg=none guifg=LightRed
highligh GitGutterChangeDelete guibg=none guifg=LightRed

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
            \ 'prompt':  ['fg', 'Yellow'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
" for tmux blinking cursor: https://github.com/neovim/neovim/wiki/FAQ#flick-cursor-when-use-neovim-under-tmux
" hi EndOfBuffer ctermbg=NONE ctermfg=200 cterm=NONE
" hi Normal ctermbg=NONE ctermfg=200 cterm=NONE

" Statusline highlight
" From https://github.com/phaazon/config/blob/master/nvim-lua/statusline.vim
hi StatusLineBg guibg=#23272e guifg=#efefef
hi StatusLineBg2 guibg=#23272e guifg=#efefef
hi StatusLineBg2b guibg=#23272e guifg=#5B6268
hi StatusLineBg2c guibg=#5B6268 guifg=#23272e

hi StatusLineLinNbr guibg=#23272e guifg=#51afef
hi StatusLineColNbr guibg=#23272e guifg=#98be65

hi StatusLineGitBranchSymbol guibg=#23272e guifg=#ff6c6b
hi StatusLineGitBranchName guibg=#23272e guifg=#da8548
hi StatusLineGitDiffNone guibg=#23272e guifg=#98be65
hi StatusLineGitDiffAdd guibg=#23272e guifg=LightGreen
hi StatusLineGitDiffMod guibg=#23272e guifg=LightBlue
hi StatusLineGitDiffDel guibg=#23272e guifg=LightRed

hi StatusLineALEMsg guibg=#23272e guifg=#da8548
hi StatusLineALEErrors guibg=#23272e guifg=#ff6c6b
hi StatusLineALEWarnings guibg=#23272e guifg=#ECBE7B
hi StatusLineALEInformations guibg=#23272e guifg=#51afef
hi StatusLineALEHints guibg=#23272e guifg=#c678dd

hi StatusLineCurrentSymbolName guibg=#23272e guifg=#c678dd
hi StatusLineCurrentSymbolType guibg=#23272e guifg=#98be65 gui=italic
hi StatusLineCurrentSymbolBracket guibg=#23272e guifg=#5B6268 gui=italic

hi StatusLineNormalMode guibg=#51afef guifg=#23272e
hi StatusLineNormalModeItalic guibg=#51afef guifg=#23272e gui=italic
hi StatusLineNormalModeWinNr guibg=#317a91 guifg=#23272e

hi StatusLineInsertMode guibg=#98be65 guifg=#23272e
hi StatusLineInsertModeItalic guibg=#98be65 guifg=#23272e gui=italic
hi StatusLineInsertModeWinNr guibg=#62803b guifg=#23272e

hi StatusLineReplaceMode guibg=#ff6c6b guifg=#23272e
hi StatusLineReplaceModeItalic guibg=#ff6c6b guifg=#23272e
hi StatusLineReplaceModeWinNr guibg=#b64a49 guifg=#23272e

hi StatusLineVisualMode guibg=#fe8019 guifg=#23272e
hi StatusLineVisualModeItalic guibg=#fe8019 guifg=#23272e gui=italic
hi StatusLineVisualModeWinNr guibg=#994806 guifg=#23272e
hi StatusLineVisualBlockMode guibg=#fe8019 guifg=#23272e
hi StatusLineVisualBlockModeItalic guibg=#fe8019 guifg=#23272e gui=italic
hi StatusLineVisualBlockModeWinNr guibg=#994806 guifg=#23272e
hi StatusLineVisualLineMode guibg=#fe8019 guifg=#23272e
hi StatusLineVisualLineModeItalic guibg=#fe8019 guifg=#23272e gui=italic
hi StatusLineVisualLineModeWinNr guibg=#994806 guifg=#23272e
hi StatusLineSelectMode guibg=#fe8019 guifg=#23272e
hi StatusLineSelectModeItalic guibg=#fe8019 guifg=#23272e gui=italic
hi StatusLineSelectModeWinNr guibg=#994806 guifg=#23272e
hi StatusLineSelectLineMode guibg=#fe8019 guifg=#23272e
hi StatusLineSelectLineModeItalic guibg=#fe8019 guifg=#23272e gui=italic
hi StatusLineSelectLineModeWinNr guibg=#994806 guifg=#23272e
hi StatusLineSelectBlockMode guibg=#fe8019 guifg=#23272e
hi StatusLineSelectBlockModeItalic guibg=#fe8019 guifg=#23272e gui=italic
hi StatusLineSelectBlockModeWinNr guibg=#994806 guifg=#23272e

hi StatusLineCommandMode guibg=#5B6268 guifg=#23272e
hi StatusLineCommandModeItalic guibg=#5B6268 guifg=#23272e gui=italic
hi StatusLineCommandModeWinNr guibg=#42474b guifg=#23272e

hi StatusLineHitEnterPromptMode guibg=#ff6c6b guifg=#23272e
hi StatusLineHitEnterPromptModeItalic guibg=#ff6c6b guifg=#23272e gui=italic
hi StatusLineHitEnterPromptModeWinNr guibg=#b64a49 guifg=#23272e


" =======================
" Deprecated
" =======================

" airline
" let g:airline_theme='gruvbox'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#fnamecollapse = 1
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_splits = 1
" let g:airline#extensions#tabline#show_tab_count = 0
" let g:airline#extensions#tabline#show_tab_nr = 0
" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#tab_nr_type = 2
" let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#virtualenv#enabled = 0
" let g:airline#extensions#csv#enabled = 1
" let g:airline#extensions#hunks#enabled = 1
" let g:airline_extensions = ['ale', 'branch', 'fugitiveline', 'tabline']
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>[ <Plug>AirlineSelectPrevTab
" nmap <leader>] <Plug>AirlineSelectNextTab
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ' '
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = ' '
" let g:airline_section_b = "%{airline#util#wrap(airline#extensions#branch#get_head(),80)} %{get(b:,'gitsigns_status','')}"
" let g:airline_filetype_overrides = {
"     \ 'coc-explorer':  [ 'CoC Explorer', '' ],
"     \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
"     \ 'help':  [ 'Help', '%f' ],
"     \ 'vim-plug': [ 'Plugins', '' ],
"     \ }


" highlight for gitgutter
" highlight GitGutterAdd    guifg=Yellow ctermfg=Yellow cterm=bold
" highlight GitGutterChange guifg=Cyan ctermfg=Cyan cterm=bold
" highlight GitGutterDelete guifg=Red ctermfg=Red cterm=bold
