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

function! s:fzf_task()
    let rows = asynctasks#source(&columns * 48 / 100)
    let source = []
    for row in rows
        let name = row[0]
        let source += [name . '  ' . row[1] . '  : ' . row[2]]
    endfor
    let opts = { 'source': source, 'sink': function('s:fzf_sink'),
                \ 'options': '+m --nth 1 --inline-info --tac' }
    if exists('g:fzf_layout')
        for key in keys(g:fzf_layout)
            let opts[key] = deepcopy(g:fzf_layout[key])
        endfor
    endif
    call fzf#run(opts)
endfunction

command! -nargs=0 AsyncTaskFzf call s:fzf_task()

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


" fzf for project path
function! s:fzf_project(lines)
    let l:line_list = split(a:lines[0])
    echo 'Enter Project: ' . l:line_list[0] . ' >> Path: ' . l:line_list[1]
    execute ':cd '. l:line_list[1]
    execute 'Files ' . l:line_list[1]
endfunction

command! FZFProject :call fzf#run({
            \ 'source': 'cat /Users/wangk/.config/nvim/myprojects.fzf',
            \ 'sink*': function('<sid>fzf_project'),
            \ 'window': 'call Centered_floating_window()',
            \ 'options': '--ansi --layout=reverse-list --multi --prompt "Project> "'})

" FZF for asynctasks.vim
function! s:fzf_sink(what)
    let p1 = stridx(a:what, '<')
    if p1 >= 0
        let name = strpart(a:what, 0, p1)
        let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
        if name !=# ''
            exec 'AsyncTask '. fnameescape(name)
        endif
    endif
endfunction

function! s:fzf_task()
    let rows = asynctasks#source(&columns * 48 / 100)
    let source = []
    for row in rows
        let name = row[0]
        let source += [name . '  ' . row[1] . '  : ' . row[2]]
    endfor
    let opts = { 'source': source, 'sink': function('s:fzf_sink'),
                \ 'options': '+m --nth 1 --inline-info --tac' }
    if exists('g:fzf_layout')
        for key in keys(g:fzf_layout)
            let opts[key] = deepcopy(g:fzf_layout[key])
        endfor
    endif
    call fzf#run(opts)
endfunction
command! -nargs=0 AsyncTaskFzf call s:fzf_task()


" grep in fzf
" function! SearchPRg()
"     call inputsave()
"     echohl Yellow
"     let pattern = input({'prompt': 'Enter search pattern: '})
"     if pattern !=# '' && pattern !=# '^G'
"         call inputrestore()
"         execute 'PRg ' . pattern
"     endif
"     echohl None
" endfunction


" function! s:fzf_z(lines)
"     let l:line_list = split(a:lines[0], '|')
"     echo 'Enter Path >> ' . l:line_list[0]
"     execute ':cd '. l:line_list[0]
"     execute 'Files ' . l:line_list[0]
" endfunction

" command! FZFZ :call fzf#run({
"             \ 'source': 'cat ~/.z | cut -d "|" -f 1',
"             \ 'sink*': function('<sid>fzf_z'),
"             \ 'window': 'call Centered_floating_window()',
"             \ 'options': '--ansi --multi --prompt "Z jump> "'})

" fzf highlights
" function! s:fzf_highlight_sink(line)
"     echo a:line
" endfunction

" function! s:fzf_highlight(show_code)
"     redir => cout
"     silent highlight
"     redir END
"     let raw_list = split(cout, "\n")
"     if !a:show_code
"         let list = []
"         let list_hi = []
"         for l in raw_list
"             if l[0] !=# ' '
"                 let l_list = split(l)
"                 call add(list, l_list[0] . '  xxx')
"                 call add(list_hi, l_list[0])
"             endif
"         endfor
"         call fzf#run({
"                     \ 'source': list,
"                     \ 'sink*': function('s:fzf_highlight_sink'),
"                     \ 'window': 'call Centered_floating_window()',
"                     \ 'options': '--ansi --multi --prompt "Highlights > "'})
"         for l in list_hi
"             call matchadd(l, '\v\zs' . l . ' +xxx\ze')
"         endfor
"     else
"         let list = []
"         for l in raw_list
"             if l[0] !=# ' '
"                 call add(list, l)
"             endif
"         endfor
"         call fzf#run({
"                     \ 'source': list,
"                     \ 'sink*': function('s:fzf_highlight_sink'),
"                     \ 'window': 'call Centered_floating_window()',
"                     \ 'options': '--ansi --multi --prompt "Highlights > "'})
"         for l in list
"             let l_list = split(l)
"             call matchadd(l_list[0], '\v\zs' . l_list[0] . ' +xxx\ze')
"         endfor
"     endif
" endfunction
" command! FZFHighlight call s:fzf_highlight(v:false)
" command! FZFHighlightWithCode call s:fzf_highlight(v:true)
