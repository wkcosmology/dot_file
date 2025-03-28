scriptencoding utf-8
" fzf basic configure
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction

let g:fzf_action = {
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" fzf floating window setting
let g:fzf_layout = { 'window': 'call Centered_floating_window()' }
function! Centered_floating_window()
    let width = min([&columns - 4, min([120, &columns * 95 / 100])])
    let height = min([&lines - 4, min([30, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Normal
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    augroup bufwipeout
        autocmd!
        au BufWipeout <buffer> exe 'bw '.s:buf
    augroup END
endfunction

" fzf Files
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}', '--info=inline']}, <bang>0)

command! -bang -nargs=* BTags call fzf#vim#buffer_tags(
            \ <q-args>,
            \ fzf#vim#with_preview({ "placeholder": "{2}:{3}", "options": ['--layout=reverse']}),
            \ <bang>0)

" using rg to perform the fuzzy search {{
command! -bang -nargs=* PRg
            \ call fzf#vim#grep(
            \ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
            \ 1,
            \ {
            \ 'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2],
            \ 'options': ['--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']
            \ },
            \ <bang>0)

" asynctasks.vim
function! s:fzf_sink(what)
    let p1 = stridx(a:what, '<')
    if p1 >= 0
        let name = strpart(a:what, 0, p1)
        let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
        if name !=? ''
            exec 'AsyncTask '. fnameescape(name)
        endif
    endif
endfunction

" fzf for tex (no need to install plugin) {{
function! s:bibtex_cite_sink(lines)
    let r=system('bibtex-cite ', a:lines[1])[1:]
    if a:lines[0] ==# 'ctrl-t'
        execute ':normal! a\citet{' . r . '}'
    else
        execute ':normal! a\citep[][]{' . r . '}'
    endif
endfunction

command! FZFBibtex :call fzf#run({
            \ 'source': 'bibtex-ls '.expand('%:p:h').'/bibtex.bib',
            \ 'sink*': function('<sid>bibtex_cite_sink'),
            \ 'window': 'call Centered_floating_window()',
            \ 'options': '--ansi --layout=reverse-list --expect=ctrl-t,<CR> --multi --prompt "Cite> "'})

command! FZFTexToc :call vimtex#fzf#run('cl', {'window': 'call Centered_floating_window()'})
