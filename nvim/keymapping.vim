" File: keymapping.vim
" Author: Kai Wang
" Created: 2021/02/18 
" Description: Keymapping in vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fast editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set  the leader to space
let mapleader=' '
" use Esc and C-[ to swith from insert mode to normal mode in terminal
tnoremap <Esc> <C-\><C-n><cr>
" Let Y yank to the line end
nnoremap Y y$
xnoremap <leader>p "_dP
" vim-asterisk
nmap *  <Plug>(asterisk-z*)
nmap #  <Plug>(asterisk-z#)
nmap g* <Plug>(asterisk-gz*)
nmap g# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1
" alias to left and right in insert mode
inoremap <C-b> <Left>
inoremap <C-f> <Right>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-c> <C-c>
" Clear highlight
nnoremap <C-l> :nohlsearch<cr>
" select last paste area
nmap gV `[v`]
" open another terminal
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" S-group: fuzzy search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep word under cursor
"nnoremap <leader>sw :lua require'telescope_script'.grep_current_string()<cr>
" seach within project
"nnoremap <leader>ss :lua require('telescope_script').grep_string()<cr>
" fuzzy search bibtex
nnoremap <leader>sb :Telescope bibtex<cr>
" fuzzy searching command
nnoremap <leader>s: :Telescope commands<cr>
" fuzzy search snippet
nnoremap <leader>sn :Telescope luasnip<cr>
" fuzzy search help
nnoremap <leader>sh :Telescope help_tags<cr>
" quickfix
nnoremap <leader>sq :Telescope quickfix<cr>
" yank history
nnoremap <space>sy  :Telescope neoclip<cr>
" Spell suggest
nnoremap <space>sj  <cmd>:Telescope spell_suggest<cr>
" command history
nnoremap <space>s:  :Telescope command_history<cr>
" Marks
nnoremap <leader>sm :Telescope marks<cr>
" symbols
nnoremap <leader>sc :Telescope aerial<cr>
" terminal
nnoremap <leader>st :Telescope toggleterm<cr>
" delete marks
nnoremap <leader>cm :delmarks!<cr>
" grep the word under cursor
nnoremap <leader>sw :lua require("fzf-lua").grep_cword()<cr>
nnoremap <leader>ss :lua require("fzf-lua").grep()<cr>
augroup search
  autocmd!
  autocmd FileType c,h,cpp,hpp,python,lua,vim nnoremap <buffer> <leader>so :Telescope lsp_document_symbols<cr>
  autocmd FileType tex nnoremap <buffer><silent><leader>so :FZFTexToc<cr>
  autocmd FileType tex nnoremap <buffer><silent><leader>sb :Telescope bibtex<cr>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap gd :Lspsaga goto_definition<cr>
nnoremap gh :Telescope lsp_references include_current_line=true}<cr>
nnoremap gr :Lspsaga rename ++project<cr>
nnoremap gk :Lspsaga hover_doc<cr>
nnoremap ]e :Lspsaga diagnostic_jump_next<cr>
nnoremap [e :Lspsaga diagnostic_jump_prev<cr>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-group: files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fuzzy search files under current project
"nnoremap <leader>ff :lua require('telescope_script').files(vim.fn.expand('%:p:h'))<cr>
nnoremap <leader>ff :lua require("fzf-lua").files()<cr>
" file tree
nnoremap <leader>ft :Neotree action=focus source=filesystem position=float reveal<cr>
" fuzzy search most recent file
nnoremap <leader>fr :Telescope fzf_mru<cr>
" file system
nnoremap <leader>fs :Telescope file_browser<cr>
" symbol layout
nnoremap <leader>fc :AerialToggle<cr>
nnoremap <leader>fc :lua require("aerial").fzf_lua_picker()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" B-group: buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fuzzy search buffers
nnoremap <leader>bb :Telescope buffers theme=ivy<cr>
" close current buffer
nnoremap <leader>bd :Bwipeout<cr>
" close other buffers except the current one
nnoremap <leader>bD :DeleteHiddenBuffers<cr>
" buffer switch, switch header/source
nnoremap <leader>bs :ClangdSwitchSourceHeader<cr>
" nmap cd call
nnoremap cd :call <SID>CdPwd()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <C-t>-group: tabs
" Tab is deprecated
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-t> <Nop>
nmap <C-t>n :TabooOpen 
nmap <C-t>r :TabooRename 
nmap <C-t>c :tabclose<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" windowshift
nnoremap <C-w>e <cmd>SwapSplit<CR>
" toggle zoom
let g:maximizer_set_default_mapping = 0
nnoremap <C-w>m :MaximizerToggle<cr>
" choose the window
for i in [1, 2, 3, 4, 5, 6]
  execute 'nnoremap <C-w>'.i.' '.i.'<C-w>w'
endfor
augroup close_win
  autocmd!
  autocmd FileType fzf,help,qf,defx,fugitive,list,git,gista-list,fugitiveblame nnoremap <buffer> <C-c> :close<cr>
  autocmd FileType fzf,help,qf,defx,fugitive,list,git,gista-list inoremap <buffer> <C-c> :close<cr>
  autocmd FileType list inoremap <buffer> <C-c> :close<cr>
  autocmd FileType toggleterm tnoremap <buffer> <C-g> <cmd>:close<cr>
  autocmd FileType toggleterm inoremap <buffer> <C-g> <cmd>:close<cr>
  autocmd FileType toggleterm nnoremap <buffer> <C-g> :close<cr>
  autocmd FileType toggleterm,fugitiveblame nnoremap <buffer> q :close<cr>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" G-group: Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gd :lua require('script').toggle_git_diff()<cr>
nnoremap <leader>gh :diffget //2<cr>
nnoremap <leader>gl :diffget //3<cr>
nnoremap <leader>gg :G<cr>
nnoremap <leader>gv :GV<cr>
nnoremap <leader>gm :Git blame<cr>
nnoremap <leader>gP :Git push<cr>
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gf :Git fetch<cr>
nnoremap <leader>gs :lua require('telescope_script').git_status()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" X-group: Copy
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>xn :let @+=@%<cr>
nnoremap <leader>xf :let @+=expand("%:t")<cr>
nnoremap <leader>xw "+yiw
vnoremap <leader>xx "+y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diagnostic key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clear all the diagnostic 
nmap <leader>ed :lua vim.diagnostic.disable()<cr>
nmap <leader>ec :lua vim.diagnostic.hide()<cr>
nmap <leader>et :Neotree diagnostics reveal bottom<cr>
augroup FormatFiletype
  autocmd!
  autocmd BufEnter * nnoremap gj :Format<cr>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ud :UndotreeToggle<cr>
augroup my_file_type_map
  autocmd!
  " execute command
  autocmd FileType lua nnoremap <buffer> <leader>ee :execute 'write<bar>luafile %'<cr>
  autocmd FileType vim nnoremap <buffer> <leader>ee :execute 'write<bar>source %'<cr>
  autocmd FileType zsh nnoremap <buffer> <leader>ee :execute 'write<bar>!source ~/.zshrc'<cr>
  autocmd FileType tex nmap <buffer> <leader>ee :execute 'write<bar>VimtexCompile'<cr>
  autocmd FileType python noremap <buffer><silent> <leader>ee :AsyncTask file-run<cr>
  autocmd FileType c,cpp,h,cpp noremap <buffer><silent> <leader>ee :AsyncTask file-build<cr>
  " locate for vimtex
  autocmd FileType tex nnoremap <buffer> <leader>vv :VimtexView<cr>
  autocmd FileType tex nnoremap <buffer> <leader>vc :VimtexTocOpen<cr>
  autocmd FileType tex nnoremap <buffer> <leader>cc :VimtexClean<cr>
  autocmd Filetype markdown,html,typescript,javascript,json,css,yaml nnoremap <buffer> <leader>fm :Prettier<cr>
  autocmd Filetype markdown nmap <C-j> <Plug>(spelunker-jump-next)
  autocmd Filetype markdown nmap <C-k> <Plug>(spelunker-jump-prev)
augroup END
" document generator
nnoremap <leader>dg :Neogen<cr>
" seach project
nnoremap <leader>pp :lua require('telescope').extensions.project.project{}<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! CloseFloatingWin execute 'windo call <SID>closefloatingwin()'
command! DeleteHiddenBuffers call DeleteHiddenBuffers()
" trim space
command! TrimSpace execute':%s/\s\+$//e'
command! -bar -bang Trash :Move<bang> ~/.Trash | bdelete<bang>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup my_fugitive_mapping
  autocmd FileType fugitive nnoremap <buffer> fP :Git push --force-with-lease<cr>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" script for closing the floating window
fun! s:closefloatingwin()
  if &filetype ==# 'toggleterm'
    execute 'close'
  elseif &filetype ==# 'fzf'
    execute 'close'
  elseif &filetype ==# 'undotree'
    execute 'close'
  elseif &filetype ==# 'NvimTree'
    execute 'close'
  endif
endf

" close all hidden buffers
if !exists('*DeleteHiddenBuffers') " Clear all hidden buffers when running
  function DeleteHiddenBuffers() " Vim with the 'hidden' option
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'exten(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
      silent execute 'bwipeout!' buf
    endfor
  endfunction
endif

" cd the path of current buffer
fun! s:CdPwd()
  if FugitiveHead() ==# ''
    execute 'cd %:p:h'
    echo 'Enter path >> ' . expand('%:p:h')
  else
    let path = FugitiveGitDir()[0:-6]
    execute 'cd' . path
    echo 'Enter path >> ' . path
  end
endf
