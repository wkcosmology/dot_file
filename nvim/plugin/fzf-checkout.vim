"let g:fzf_branch_actions = {
"      \ 'checkout': {
"      \   'prompt': '  Checkout > ',
"      \   'execute': 'Git checkout {branch}',
"      \   'multiple': v:false,
"      \   'keymap': 'enter',
"      \   'required': ['branch'],
"      \   'confirm': v:false,
"      \ },
"      \ 'track': {
"      \   'prompt': '  Track > ',
"      \   'execute': 'Git checkout --track {branch}',
"      \   'multiple': v:false,
"      \   'keymap': 'alt-enter',
"      \   'required': ['branch'],
"      \   'confirm': v:false,
"      \ },
"      \ 'create': {
"      \   'prompt': '  Create > ',
"      \   'execute': 'Git checkout -b {input}',
"      \   'multiple': v:false,
"      \   'keymap': 'ctrl-k',
"      \   'required': ['input'],
"      \   'confirm': v:true,
"      \ },
"      \ 'delete': {
"      \   'prompt': '  Delete > ',
"      \   'execute': 'Git branch -D {branch}',
"      \   'multiple': v:true,
"      \   'keymap': 'ctrl-d',
"      \   'required': ['branch'],
"      \   'confirm': v:true,
"      \ },
"      \ 'merge':{
"      \   'prompt': '  Merge > ',
"      \   'execute': 'Git merge {branch}',
"      \   'multiple': v:false,
"      \   'keymap': 'ctrl-e',
"      \   'required': ['branch'],
"      \   'confirm': v:true,
"      \ },
"      \ 'rebase':{
"      \   'prompt': '  Rebase > ',
"      \   'execute': 'Git rebase {branch}',
"      \   'multiple': v:false,
"      \   'keymap': 'ctrl-r',
"      \   'required': ['branch'],
"      \   'confirm': v:true,
"      \ },
"      \}
