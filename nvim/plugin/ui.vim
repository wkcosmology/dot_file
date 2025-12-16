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
hi TelescopeNormal guifg=#c6c6c6 gui=NONE
hi TelescopeSelection guifg=Orange guibg=#232423 gui=NONE cterm=NONE
hi TelescopeMatching guifg=Orange guibg=NONE gui=NONE
hi TelescopeTitle guibg=none
" floating window highlight
hi FloatNormal guibg=NONE
hi FloatBorder guibg=NONE
" FZF-lua highlight
hi FzfLuaTitle guibg=NONE
hi FzfLuaFzfPointer guifg=Orange gui=NONE
hi! link FzfLuaNormal TelescopeNormal
hi! link FzfLuaBorder TelescopeBorder
hi! link FzfLuaFzfCursorLine TelescopeSelection
hi! link FzfLuaFzfMatch TelescopeMatching
" lsp signature
hi LspSignatureActiveParameter guibg=NONE guifg=#F08000
" for tmux blinking cursor: https://github.com/neovim/neovim/wiki/FAQ#flick-cursor-when-use-neovim-under-tmux
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
hi def link MyTodo Todo
