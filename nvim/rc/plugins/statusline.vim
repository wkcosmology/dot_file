function! VcsStatus()
  let branch = fugitive#head()
  let b:branch_maxwin = 20

  if branch ==# ''
    return ''
  endif

  let [a,m,r] = GitGutterGetHunkSummary()
  let ahl = ''
  let mhl = ''
  let rhl = ''
  if a > 0
    let ahl .= '%#StatusLineGitDiffAdd#'
  else
    let ahl .= '%#StatusLineBg2b#'
  end

  if m > 0
    let mhl .= '%#StatusLineGitDiffMod#'
  else
    let mhl .= '%#StatusLineBg2b#'
  end

  if r > 0
    let rhl .= '%#StatusLineGitDiffDel#'
  else
    let rhl .= '%#StatusLineBg2b#'
  end

  return printf(' %%#StatusLineGitBranchSymbol# %%#StatusLineGitBranchName#%s %s %d  %s %d  %s %d ', trim(branch), ahl, a, mhl, m, rhl, r)
endfunction

function! ALEStatus() abort
    let sl = ''
    let ale_res = ale#statusline#Count(winbufnr(g:statusline_winid))

    let total = ale_res['total']
    if total > 0
        let sl .= '%#StatusLineALEMsg#'
    else
        let sl .= '%#StatusLineBg2b#'
    end
    let sl .= get(g:ale_linters, &filetype, [''])[0] . ' '

    let errors = ale_res['error']
    if errors > 0
        let sl .= '%#StatusLineALEErrors#'
    else
        let sl .= '%#StatusLineBg2b#'
    end
    let sl .= printf('  %d', errors)

    let warnings = ale_res['warning']
    if warnings > 0
        let sl .= '%#StatusLineALEWarnings#'
    else
        let sl .= '%#StatusLineBg2b#'
    end
    let sl .= printf('   %d ', warnings)

  return sl
endfunction

function! GetFileName()
  let b:max_width = 3 * winwidth(g:statusline_winid) / 5
  let b:file_name = bufname(winbufnr(g:statusline_winid))
  let b:width = strwidth(b:file_name)

  if b:width == 0
    let b:file_name = '[scratch]'
  else
    " If the file name is too big, we just write its tail part
    if b:width > b:max_width
      let b:file_name = fnamemodify(b:file_name, ':t')
    endif

    if exists('*WebDevIconsGetFileTypeSymbol')
      let b:file_name = printf('%s %s', WebDevIconsGetFileTypeSymbol(b:file_name), b:file_name)
    endif
  endif

  return b:file_name
endfunction

function! MakeActiveStatusLine()
  let b:hls = {
    \ 'n': {
      \ 'n': 'StatusLineNormalMode',
      \ 'i': 'StatusLineNormalModeItalic',
      \ 'nr': 'StatusLineNormalModeWinNr'
      \ },
    \ 'i': {
      \ 'n': 'StatusLineInsertMode',
      \ 'i': 'StatusLineInsertModeItalic',
      \ 'nr': 'StatusLineInsertModeWinNr'
      \ },
    \ "\<C-v>": {
      \ 'n': 'StatusLineVisualMode',
      \ 'i': 'StatusLineVisualModeItalic',
      \ 'nr': 'StatusLineVisualModeWinNr'
      \ },
    \ 'v': {
      \ 'n': 'StatusLineVisualMode',
      \ 'i': 'StatusLineVisualModeItalic',
      \ 'nr': 'StatusLineVisualModeWinNr'
      \ },
    \ 'V': {
      \ 'n': 'StatusLineVisualLineMode',
      \ 'i': 'StatusLineVisualLineModeItalic',
      \ 'nr': 'StatusLineVisualLineModeWinNr'
      \ },
    \ '': {
      \ 'n': 'StatusLineVisualBlockMode',
      \ 'i': 'StatusLineVisualBlockModeItalic',
      \ 'nr': 'StatusLineVisualBlockModeWinNr'
      \ },
    \ 'R': {
      \ 'n': 'StatusLineReplaceMode',
      \ 'i': 'StatusLineReplaceModeItalic',
      \ 'nr': 'StatusLineReplaceModeWinNr'
      \ },
    \ 'c': {
      \ 'n': 'StatusLineCommandMode',
      \ 'i': 'StatusLineCommandModeItalic',
      \ 'nr': 'StatusLineCommandModeWinNr'
      \ },
    \ 'r?': {
      \ 'n': 'StatusLineHitEnterPromptMode',
      \ 'i': 'StatusLineHitEnterPromptModeItalic',
      \ 'nr': 'StatusLineHitEnterPromptModeWinNr'
      \ },
    \ }
  let b:hl = 'StatusLineBg'
  let b:hl2 = 'StatusLineBg2c'

  if has_key(b:hls, mode()) == 1
    if &modified
      let b:hl = b:hls[mode()]['i']
    else
      let b:hl = b:hls[mode()]['n']
    endif

    let b:hl2 = b:hls[mode()]['nr']
  endif


  let b:status_line = printf('%%#%s# %d %%#%s# %s ', b:hl2, win_id2win(g:statusline_winid), b:hl, GetFileName())
  let b:status_line .= '%#StatusLineLinNbr# %v%#StatusLineBg2b#:%#StatusLineColNbr#%l%< %#StatusLineBg2b#(%p%% %LL)'
  let b:status_line .= printf('%%=%%#StatusLineBg# %s%s ', ALEStatus(), VcsStatus())

  return b:status_line
endfunction

function! MakeInactiveStatusLine()
  let b:hl = 'StatusLineBg2c'
  let b:hlend = 'StatusLineBg'
  let b:status_line = printf(' %d %%#%s# %s %%#%s#', win_id2win(g:statusline_winid), b:hl, GetFileName(), b:hlend)
  return b:status_line
endfunction

augroup mystatusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!MakeActiveStatusLine()
    autocmd WinLeave,BufLeave * setlocal statusline=%!MakeInactiveStatusLine()
augroup END

