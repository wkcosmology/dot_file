" scriptencoding utf-8
set cmdheight=1
syntax enable
set background=dark
set signcolumn=yes
set shortmess+=c
" Cursor column and line
set conceallevel=0
set termguicolors
set shiftwidth=4
" winbar and no global status line
set laststatus=2
lua vim.opt.winbar = " "
" set winbar=%=%m\ %f
" moonfly config
let g:moonflyTransparent = 1
let g:moonflyUndercurls = 0
highlight Visual guibg=#4A555A
" highlight Pmenu for auto completion
hi Pmenu ctermfg=251 ctermbg=235 guifg=#bab8b8 guibg=#363535
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
" treesitter
hi! TSUnderline guibg=none gui=none
"SwapSplit window
hi SwapSplitStatusLine guifg=#000000 guibg=#ff8383
" telescope highlight
hi TelescopeNormal guifg=#c6c6c6
hi TelescopeSelection guifg=#F08000 guibg=#2d2e2d
hi TelescopeMatching guifg=#F08000 guibg=none
hi TelescopeBorder guifg=#c6c6c6 guibg=none
" lsp signature
hi LspSignatureActiveParameter guibg=none guifg=#F08000
" fzf highlight
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Constant'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn', 'Cursor'],
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
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
hi def link MyTodo Todo
