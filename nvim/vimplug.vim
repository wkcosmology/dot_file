set rtp+=~/.vim
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
" Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'
" abbreviation substitution and Coerion
Plug 'tpope/vim-abolish'
" add more text object
Plug 'wellle/targets.vim'
" auto add pairs
" Plug 'windwp/nvim-autopairs'
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
Plug 'stevearc/aerial.nvim'
" undo tree visualizer
Plug 'mbbill/undotree'
" vim for vim
Plug 'tpope/vim-scriptease'
" mark the mark
" Plug 'kshenoy/vim-signature'
" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" dispatch run the tasks
Plug 'tpope/vim-dispatch'
" powerful replacement tool
Plug 'windwp/nvim-spectre'
" quick navi the working files
Plug 'ThePrimeagen/harpoon'

" ---------------------------------------------------------------------------
" fzf
" ---------------------------------------------------------------------------
" fzf plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" fzf vim plugin
Plug 'junegunn/fzf.vim'
" git branched
Plug 'stsewd/fzf-checkout.vim'
" fzf history
Plug 'pbogut/fzf-mru.vim'

" ---------------------------------------------------------------------------
" Buffer/Window/Session
" ---------------------------------------------------------------------------
" kill the buffer while keep the window
Plug 'moll/vim-bbye'
" the following two plugs is for session
" Plug 'rmagatti/auto-session'
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'j-morano/buffer_manager.nvim'
Plug 'xorid/swap-split.nvim'

" ---------------------------------------------------------------------------
" ui
" ---------------------------------------------------------------------------
" color theme
Plug 'bluz71/vim-moonfly-colors'
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
" improve the default vim.ui interfaces
Plug 'stevearc/dressing.nvim'

" ---------------------------------------------------------------------------
" C/C++ related
" ---------------------------------------------------------------------------
" switch header and source file
Plug 'derekwyatt/vim-fswitch', {'for': ['c', 'cpp', 'h', 'hpp']}

" ---------------------------------------------------------------------------
" Git
" ---------------------------------------------------------------------------
" show git modified line in the state column
Plug 'lewis6991/gitsigns.nvim'
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
Plug 'akinsho/toggleterm.nvim'
" add head information
Plug 'alpertuna/vim-header', { 'on': 'AddHeader'}
" run the test file, support many filetypes, including python
Plug 'vim-test/vim-test', {'on': ['TestNearest', 'TestFile']}
" task control
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" vimtex
" Plug 'lervag/vimtex'
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
" lua for vim development
Plug 'tjdevries/nlua.nvim'
" filetree in lua
Plug 'karb94/neoscroll.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v2.x' }
Plug 'karb94/neoscroll.nvim'

" ---------------------------------------------------------------------------
" Lsp and related
" ---------------------------------------------------------------------------
" lsp config
Plug 'neovim/nvim-lspconfig'
" cmp related
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'kdheepak/cmp-latex-symbols', { 'for': ['tex'] }
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'lukas-reineke/cmp-under-comparator'
Plug 'hrsh7th/cmp-cmdline'
" lsp UI
Plug 'nvim-lua/lsp-status.nvim'
Plug 'onsails/lspkind-nvim'
" diagnostic
Plug 'mrbjarksen/neo-tree-diagnostics.nvim'
" colors for diagnostics highlight
Plug 'folke/lsp-colors.nvim'
" formatter
Plug 'mhartington/formatter.nvim'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" ---------------------------------------------------------------------------
" Lua
" ---------------------------------------------------------------------------
Plug 'RishabhRD/popfix', { 'for': ['lua'] }

" ---------------------------------------------------------------------------
" web development
" ---------------------------------------------------------------------------
Plug 'tamago324/vim-browsersync'
Plug 'tyru/open-browser.vim'
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'AndrewRadev/tagalong.vim'

" ---------------------------------------------------------------------------
" Telescope and related
" ---------------------------------------------------------------------------
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make CC=/opt/homebrew/bin/gcc-12' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-bibtex.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'tami5/sqlite.lua'
" Plug 'hrsh7th/nvim-pasta'
Plug 'AckslD/nvim-neoclip.lua'

call plug#end()
" end of vim plugins manager:vim-plug------------------------------------------
" :setlocal foldmethod=marker
"
