" File: keymapping.vim
" Author: Kai Wang
" Created: 2021/02/18 
" Description: Keymapping in vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fast editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set  the leader to space
let mapleader=' '
" use Esc to exit terminal
tnoremap <Esc> <C-\><C-n><cr>
" Let Y yank to the line end
nnoremap Y y$
xnoremap <leader>p "_dP
" subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
" vim-asterisk
nmap *  <Plug>(asterisk-z*)
nmap #  <Plug>(asterisk-z#)
nmap g* <Plug>(asterisk-gz*)
nmap g# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1
" alias to left and right in insert mode
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-c> <C-c>
" cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" Clear highlight
nnoremap <silent> <C-l> :nohlsearch<cr>
" keymapping for hop
nmap <silent> <leader>jj :call MyHop('char1')<cr>
nmap <silent> <leader>jk :call MyHop('char2')<cr>
nmap <silent> <leader>jw :call MyHop('word')<cr>
nmap <silent> <leader>jl :call MyHop('line')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" S-group: fuzzy search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fuzzy searching command
nnoremap <silent> <leader>: :Telescope commands<cr>
" fuzzy search snippet
nnoremap <silent> <leader>ss :Telescope luasnip<cr>
" fuzzy search help
nnoremap <silent> <leader>sh :Telescope help_tags<cr>
" quickfix
nnoremap <silent> <leader>sq :Telescope quickfix<cr>
" grep word under cursor
nnoremap <silent> <leader>sw :lua require'telescope_script'.grep_current_string()<cr>
" yank history
nnoremap <silent> <space>sy  :Telescope neoclip<cr>
" Symbols
nnoremap <silent> <space>se  :lua require'telescope.builtin'.symbols{ sources = {'math'} }<cr>
" command history
nnoremap <silent> <space>cr  :Telescope command_history<cr>
" marks
nnoremap <silent> <space>sm :Marks<cr>
augroup search
  autocmd!
  autocmd FileType c,h,cpp,hpp,python,lua,vim nnoremap <silent> <buffer><silent> <leader>so :Telescope lsp_document_symbols<cr>
  autocmd FileType tex nnoremap <silent> <buffer><silent><leader>so :FZFTexToc<cr>
  autocmd FileType tex nnoremap <silent> <buffer><silent><leader>sb :Telescope bibtex<cr>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> gd :Lspsaga goto_definition<cr>
nnoremap <silent> gi :Telescope lsp_implementations<cr>
nnoremap <silent> gh :Lspsaga finder<cr>
nnoremap <silent> gr :Lspsaga rename ++project<cr>
nnoremap <silent> <Leader>ca :Lspsaga code_action<cr>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<cr>
nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<cr>
" nnoremap <silent> <leader>vc :Lspsaga outline<cr>
nnoremap <silent> <leader>vc :AerialToggle<cr>
nnoremap <silent> K :Lspsaga hover_doc<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" P-group: Project related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fuzzy search for my projects
nnoremap <silent> <Leader>pp :lua require('telescope').extensions.project.project{}<cr>
nnoremap <silent> <leader>ps :lua require('telescope_script').grep_string()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-group: File related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fuzzy search files under current project
nnoremap <silent> <Leader>ff :lua require('telescope_script').files(vim.fn.expand('%:p:h'))<cr>
" fuzzy search most recent file
" nnoremap <silent> <leader>fr :FZFMru --prompt "MRU> "<cr>
nnoremap <silent> <leader>fr :Telescope frecency<cr>
" open defx file tree
nnoremap <silent> <Leader>ft :Neotree<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" B-group: buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fuzzy search buffers
nnoremap <silent> <leader>bb :Telescope buffers<cr>
" close current buffer
nmap <silent> <leader>bd :Bwipeout<cr>
" close other buffers except the current one
nmap <silent> <leader>bD :DeleteHiddenBuffers<cr>
" buffer switch, switch header/source
nmap <leader>bs :ClangdSwitchSourceHeader<cr>
" nmap cd call
nmap cd :call <SID>CdPwd()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <C-t>-group: tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-t> <Nop>
nmap <C-t>n :TabooOpen 
nmap <C-t>r :TabooRename 
nmap <C-t>c :tabclose<cr>
nmap <C-t>] :tabnext<cr>
nmap <C-t>[ :tabprevious<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle zoom
" let g:maximizer_default_mapping_key = '<C-w>m'
let g:maximizer_set_default_mapping = 0
nnoremap <silent><C-w>m :MaximizerToggle<cr>
" choose the window
nnoremap <silent> <C-w>w :lua require('nvim-window').pick()<cr>
nnoremap <silent> <C-w>e :lua require("swap-split").swap()<cr>
" close the location list and quickfix window
nnoremap <silent> <leader>lc :ccl\|lcl<cr>
noremap <silent> <F3> :copen<cr>
noremap <silent> <F4> :lopen<cr>
augroup close_win
  autocmd!
  autocmd FileType fzf,help,qf,defx,fugitive,list,git,gista-list,fugitiveblame nnoremap <buffer> <C-c> :close<cr>
  autocmd FileType fzf,help,qf,defx,fugitive,list,git,gista-list inoremap <buffer> <C-c> :close<cr>
  autocmd FileType list inoremap <buffer> <C-c> :close<cr>
  autocmd FileType toggleterm tnoremap <buffer> <C-g> <C-\><C-n>:close<cr>
  autocmd FileType toggleterm inoremap <buffer> <C-g> <C-\><C-n>:close<cr>
  autocmd FileType toggleterm nnoremap <buffer> <C-g> :close<cr>
  autocmd FileType toggleterm nnoremap <buffer> <C-c> :close<cr>
  autocmd FileType toggleterm nnoremap <buffer> q :close<cr>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" G-group: Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gd :lua require('script').toggle_git_diff()<cr>
nnoremap <leader>gh :diffget //2<cr>
nnoremap <leader>gl :diffget //3<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gg :G<cr>
nnoremap <leader>gv :GV<cr>
nnoremap <silent> <leader>gb :GBranches checkout<cr>
nnoremap <leader>gm :Git blame<cr>
nnoremap <leader>gP :Git push<cr>
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gf :Git fetch<cr>
nnoremap <leader>gs :lua require('telescope_script').git_status()<cr>
nnoremap <leader>gc :lua require('script').git_clean()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" M-group: Marks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>mm :Telescope marks<cr>
nnoremap <leader>mc :delmarks!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diagnostic key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clear all the diagnostic 
nmap <silent> <leader>ed :lua vim.diagnostic.disable()<cr>
nmap <silent> <leader>ec :lua vim.diagnostic.hide()<cr>
nmap <silent> <leader>et :Neotree diagnostics reveal bottom<cr>
" nmap <leader>fm :lua vim.buf.formatting()<cr>
augroup FormatFiletype
  autocmd!
  autocmd BufEnter * nmap <silent> <leader>fm :Format<cr>
  " autocmd BufEnter *.tex nmap <leader>fm gqap
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
  " autocmd FileType lua nnoremap <buffer> <leader>fm :call LuaFormat()<cr>
  autocmd Filetype markdown,html,typescript,javascript,json,css,yaml nnoremap <buffer> <leader>fm :Prettier<cr>
  autocmd Filetype markdown nmap <C-j> <Plug>(spelunker-jump-next)
  autocmd Filetype markdown nmap <C-k> <Plug>(spelunker-jump-prev)
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! CloseFloatingWin execute 'windo call <SID>closefloatingwin()'
command! DeleteHiddenBuffers call DeleteHiddenBuffers()
" trim space
command! TrimSpace execute':%s/\s\+$//e'
command! -bar -bang Trash :Move<bang> ~/.Trash | bdelete<bang>

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
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
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
