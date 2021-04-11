" vim plugins manager:vim-plug-----------------------------------------------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" ---------------------------------------------------------------------------
" fast edit
" ---------------------------------------------------------------------------
" highlights patterns and ranges, and preview
Plug 'markonm/traces.vim'
" enhance * search
Plug 'haya14busa/vim-asterisk'
" powerful!!! operate on surround
Plug 'tpope/vim-surround'
" enhance . operate, support more like vim-surround
Plug 'tpope/vim-repeat'
" lua version of easymotion
 Plug 'phaazon/hop.nvim'
" for quick commentary
Plug 'tpope/vim-commentary'
" abbreviation substitution and Coerion
Plug 'tpope/vim-abolish'
" add more text object
Plug 'wellle/targets.vim'
" auto add pairs
Plug 'jiangmiao/auto-pairs'
" display number of matchings
Plug 'google/vim-searchindex'
" define s as substitution
Plug 'svermeulen/vim-subversive'
" Great snippet tool, need backend source
Plug 'SirVer/ultisnips'
" Useful UNIX command
Plug 'tpope/vim-eunuch'
" align
Plug 'junegunn/vim-easy-align'
" markdown
Plug 'godlygeek/tabular', { 'for': ['markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
" document
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" matchup
Plug 'andymass/vim-matchup'
" tagbar
Plug 'liuchengxu/vista.vim'
" undo tree visualizer
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle', 'UndotreeShow'] }
" vim for vim
Plug 'tpope/vim-scriptease'
" mark the mark
Plug 'kshenoy/vim-signature'
" prettier
Plug 'prettier/vim-prettier'
" dispatch run the tasks
Plug 'tpope/vim-dispatch'

" ---------------------------------------------------------------------------
" coc/fzf
" ---------------------------------------------------------------------------
" coc plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" fzf vim plugin
Plug 'junegunn/fzf.vim'
" using fzf window for coc, current for coc-yank
Plug 'antoinemadec/coc-fzf'
" coc for floaterm
Plug 'voldikss/fzf-floaterm', { 'on': ['FloatermNew', 'Floaterms', 'FloatermToggle']}
" git branched
Plug 'stsewd/fzf-checkout.vim'
Plug 'pbogut/fzf-mru.vim'

" ---------------------------------------------------------------------------
" Buffer/Window/Session
" ---------------------------------------------------------------------------
" kill the buffer while keep the window
Plug 'moll/vim-bbye'
" the following two plugs is for session
Plug 'xolox/vim-misc', { 'on':  ['OpenSession', 'SaveSession', 'ViewSession'] }
Plug 'xolox/vim-session', { 'on':  ['OpenSession', 'SaveSession', 'ViewSession'] }

" ---------------------------------------------------------------------------
" ui
" ---------------------------------------------------------------------------
" color theme
" Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/edge'
" show the doc on echo, deprecated since coc is better
Plug 'Shougo/echodoc.vim'
" let the cursor stay away from ceil and bottom
Plug 'drzel/vim-scrolloff-fraction'
" statusline
Plug 'wkcosmology/statusline'
" show the vertical lines to represent the indent
Plug 'Yggdroot/indentLine'
" maximum and restore current window, powerful!!!
Plug 'szw/vim-maximizer'
" pretty tab line
Plug 'gcmt/taboo.vim'
" devicons
Plug 'ryanoasis/vim-devicons'
" choose the window
Plug 't9md/vim-choosewin', 
" start up window
Plug 'mhinz/vim-startify'

" ---------------------------------------------------------------------------
" C/C++ related
" ---------------------------------------------------------------------------
" GDB
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh', 'for': ['c', 'cpp', 'h', 'hpp']}
" switch header and source file
Plug 'derekwyatt/vim-fswitch', {'for': ['c', 'cpp', 'h', 'hpp']}

" ---------------------------------------------------------------------------
" Git
" ---------------------------------------------------------------------------
" show git modified line in the state column
Plug 'airblade/vim-gitgutter'
" powerful git tool
Plug 'tpope/vim-fugitive'
" tree like git browser
Plug 'junegunn/gv.vim', { 'on': 'GV' }
" github
Plug 'pwntester/octo.nvim'

" ---------------------------------------------------------------------------
" Anxuliary
" ---------------------------------------------------------------------------
" useful plugin for lua
Plug 'nvim-lua/plenary.nvim'
" Great terminal tool
Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'Floaterms', 'FloatermToggle']}
" asynchronously check error
Plug 'dense-analysis/ale'
" add head information
Plug 'alpertuna/vim-header', { 'on': 'AddHeader'}
" run the test file, support many filetypes, including python
" Plug 'vim-test/vim-test', {'on': ['TestNearest', 'TestFile']}
" task control
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" vimtex
Plug 'lervag/vimtex'
" spell check
Plug 'kamykn/spelunker.vim', { 'for': ['tex', 'markdown', 'html', 'json'] }
" gist
Plug 'lambdalisue/vim-gista', { 'on': ['Gista'] }
" Cheatsheet for vim
Plug 'lifepillar/vim-cheat40', { 'on': ['Cheat'] }
" cheat
Plug 'RishabhRD/popfix', { 'on': ['Cheat', 'CheatList'] }
Plug 'RishabhRD/nvim-cheat.sh', { 'on': ['Cheat', 'CheatList'] }
" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
" highlight color code
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" lua for vim development
Plug 'tjdevries/nlua.nvim'
" Plug 'chimay/wheel'
" filetree in lua
Plug 'kyazdani42/nvim-tree.lua'

" ---------------------------------------------------------------------------
" Lsp and completion
" ---------------------------------------------------------------------------
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'steelsojka/completion-buffers'

" ---------------------------------------------------------------------------
" Lua
" ---------------------------------------------------------------------------
Plug 'RishabhRD/popfix'
Plug 'wkcosmology/vim-lua-format'

" ---------------------------------------------------------------------------
" web development
" ---------------------------------------------------------------------------
Plug 'tamago324/vim-browsersync'
Plug 'tyru/open-browser.vim'
Plug 'mattn/emmet-vim'

" ---------------------------------------------------------------------------
" Telescope
" ---------------------------------------------------------------------------
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-bibtex.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'


call plug#end()
" end of vim plugins manager:vim-plug------------------------------------------
" :setlocal foldmethod=marker
"
