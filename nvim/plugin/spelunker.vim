"" Enable spelunker.vim. (default: 1)
"" 1: enable
"" 0: disable
"let g:enable_spelunker_vim = 1
"
"" Enable spelunker.vim on readonly files or buffer. (default: 0)
"" 1: enable
"" 0: disable
"let g:enable_spelunker_vim_on_readonly = 0
"
"" Check spelling for words longer than set characters. (default: 4)
"let g:spelunker_target_min_char_len = 4
"
"" Max amount of word suggestions. (default: 15)
"let g:spelunker_max_suggest_words = 0
"
"" Max amount of highlighted words in buffer. (default: 100)
"let g:spelunker_max_hi_words_each_buf = 100
"
"" Spellcheck type: (default: 1)
"" 1: File is checked for spelling mistakes when opening and saving. This
"" may take a bit of time on large files.
"" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
"" depends on the setting of CursorHold `set updatetime=1000`.
"let g:spelunker_check_type = 2
"
"" Highlight type: (default: 1)
"" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
"" 2: Highlight only SpellBad.
"" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
"let g:spelunker_highlight_type = 2
"
"" Option to disable word checking.
"" Disable URI checking. (default: 0)
"let g:spelunker_disable_uri_checking = 1
"
"" Disable email-like words checking. (default: 0)
"let g:spelunker_disable_email_checking = 1
"
"" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
"" NOTE: Spell checking is also disabled for JAVA annotations.
"let g:spelunker_disable_account_name_checking = 1
"
"" Disable acronym checking. (default: 0)
"let g:spelunker_disable_acronym_checking = 1
"
"" Disable checking words in backtick/backquote. (default: 0)
"let g:spelunker_disable_backquoted_checking = 1
"
"let g:spelunker_disable_auto_group = 1
"augroup spelunker
"  autocmd!
"  autocmd BufWinEnter,BufWritePost *.md,*.html,*.tex,*.json call spelunker#check()
"  autocmd CursorHold *.md,*.tex,*.html,*.json call spelunker#check_displayed_words()
"augroup END
