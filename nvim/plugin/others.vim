" my config--------------------------------------------------------------------
" simple vim setting
filetype plugin indent on
" hybrid line number
set number relativenumber
" set cursorline!
filetype plugin indent on
" On pressing tab, insert 4 spaces
set expandtab
" set colorcolumn
set colorcolumn=120
" https://github.com/bfrg/vim-cpp-modern
let c_no_curly_error = 1
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
" python 
let g:python3_host_prog = '/Users/wangk/anaconda3/bin/python3'
let g:python_host_prog = ''
" gist_vim
let g:gist_show_privates = 1
let g:gist_edit_with_buffers = 1
let g:gist_clip_command = 'pbcopy'
" doge
let g:doge_enable_mappings=0
let g:doge_mapping_comment_jump_forward='<C-j>'
let g:doge_mapping_comment_jump_backward='<C-k>'
let g:doge_doc_standard_python='numpy'
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
