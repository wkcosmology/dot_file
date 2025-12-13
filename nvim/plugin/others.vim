" my config--------------------------------------------------------------------
" completeopt for nvim_cmp
set completeopt=menu,menuone,noselect
" wrap to prevent word break
set wrap
" simple vim setting
" update time: for vim-gitgutter
" set updatetime=100
" hybrid line number
set number relativenumber
" set cursorline!
set cursorline
" set filetype indent
filetype plugin indent on
" On pressing tab, insert 4 spaces
set expandtab
" set colorcolumn
set colorcolumn=80
hi ColorColumn guibg=#47475d
" textwidth for cpp and hpp
augroup CppFormatting
  autocmd!
  autocmd BufEnter *.cpp,*.hpp,*.c,*.h setlocal formatexpr=<cr>
  autocmd BufEnter *.cpp,*.hpp,*.c,*.h setlocal textwidth=80
augroup END
" spell for latex
augroup Spelling
  autocmd!
  autocmd FileType tex,markdown setlocal spell spelllang=en_us,en_gb
augroup END
" set hidden
set hidden
" no backup
set nobackup
" pmenu height
set pumheight=20
" set smartcase
set ignorecase
set smartcase
" indent multi times
vnoremap < <gv
vnoremap > >gv
" let the cursor in the previous place
augroup keepcursorpos
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute "normal! g`\"" |
        \ endif
augroup END
" cursor blinking
set guicursor=a:blinkon100
" CC for tree-sitter
let $CC = '(which clang)'
" python 
let g:python3_host_prog = '/Users/wangk/anaconda3/bin/python3'
let g:python_host_prog = '/Users/wangk/anaconda3/bin/python'
let g:lua_format_config = '/Users/wangk/.config/nvim/lua-format'
" vim-targets, disable nearby surround operation
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB'
" alpertuna/vim-header config
let g:header_auto_add_header = 0
let g:header_field_modified_timestamp = 0
let g:header_field_author = 'Kai Wang'
let g:header_field_author_email = 'wkcosmology@gmail.com'
let g:header_field_timestamp_format = '%m.%d.%Y'
" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
" vim-matchup
let g:matchup_matchparen_stopline = 400
let g:matchup_matchparen_offscreen = {}
" vim-session
let g:session_autosave='no'
let g:session_autoload='no'
set listchars+=eol:↲
set list
" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
" smear cursor
lua require('smear_cursor').enabled = true
