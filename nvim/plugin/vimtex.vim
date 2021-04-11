" disable imap
let g:vimtex_imaps_enabled = 1
let g:vimtex_imaps_disabled = [']]'] " This cannnot be disabled
" required by vimtex
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 0,
        \ 'continuous' : 0,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
" disable quickfix
let g:vimtex_quickfix_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 1 " open on error
let g:vimtex_quickfix_autoclose_after_keystrokes = 2
" Disable custom warnings based on regexp
let g:vimtex_quickfix_ignore_filters = []
" auto formatting
let g:vimtex_format_enabled = 1
" disable matchparen, using vim-matchup instead.
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_enabled = 1
" fold
let g:vimtex_fold_enabled = 0
let g:vimtex_fold_manual = 0
" close conceal
let g:vimtex_syntax_conceal_default = 0
" toc config
let g:vimtex_toc_config = {
      \ 'name' : 'Table of contents (VimTeX)',
      \ 'mode' : 1,
      \ 'fold_enable': 0,
      \ 'hide_line_numbers': 0,
      \ 'hotkeys_enabled': 0,
      \ 'layer_status': {
      \ 'content': 1,
      \ 'label': 0,
      \ 'todo': 1,
      \ 'include': 0,
      \ },
      \ 'resize': 0,
      \ 'refresh_always': 1,
      \ 'split_width': 50,
      \ 'tocdepth': 3,
      \ 'todo_sorted': 1
      \ }

augroup vimtex
  au!
  au User VimtexEventCompileSuccess execute 'VimtexView'
augroup END

" config for viewing though Skim
let g:vimtex_view_enabled = 1
let g:vimtex_view_method = 'skim'
let g:vimtex_view_automatic = 0 " no need for this
let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_skim_activate = 0
let g:vimtex_view_skim_reading_bar = 1

" (under testing) use zathura
" let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_forward_search_on_start = 1
" let g:vimtex_view_automatic = 0
