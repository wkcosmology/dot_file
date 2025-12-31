local vim = vim
local Plug = vim.fn["plug#"]

-- keep legacy vim runtime
vim.opt.rtp:append(vim.fn.expand("~/.vim"))

-- vim plugins manager: vim-plug ---------------------------------------------
-- Specify a directory for plugins
-- - For Neovim: ~/.local/share/nvim/plugged
-- - Avoid using standard Vim directory names like 'plugin'
vim.call("plug#begin", vim.fn.expand("~/.vim/plugged"))
-- Make sure you use single quotes (vim-plug requirement)

-- ---------------------------------------------------------------------------
-- fast edit
-- ---------------------------------------------------------------------------
-- highlights patterns and ranges, and preview
Plug("markonm/traces.vim")
-- enhance * search
Plug("haya14busa/vim-asterisk")
-- powerful!!! operate on surround
-- Plug("tpope/vim-surround")
Plug("kylechui/nvim-surround")
-- enhance . operate, support more like vim-surround
Plug("tpope/vim-repeat")
-- lua version of easymotion
Plug("folke/flash.nvim")
-- add more text object
Plug("wellle/targets.vim")
-- display number of matchings
Plug("google/vim-searchindex")
-- Great snippet tool, need backend source
Plug("L3MON4D3/LuaSnip", { ["do"] = "make install_jsregexp CC=/opt/homebrew/bin/gcc-14" })
Plug("saadparwaiz1/cmp_luasnip")
-- Useful UNIX command
Plug("tpope/vim-eunuch")
-- align
Plug("junegunn/vim-easy-align")
-- markdown
Plug("godlygeek/tabular", { ["for"] = { "markdown" } })
Plug("plasticboy/vim-markdown", { ["for"] = { "markdown" } })
-- symbols
Plug("stevearc/aerial.nvim")
-- undo tree visualizer
Plug("mbbill/undotree")
-- vim for vim
Plug("tpope/vim-scriptease")
-- prettier
Plug("prettier/vim-prettier", { ["do"] = "yarn install" })
-- dispatch run the tasks
Plug("tpope/vim-dispatch")
-- quick navi the working files
Plug("ThePrimeagen/harpoon", { ["branch"] = "harpoon2" })
-- case preserving substitute
Plug("tpope/vim-abolish")

-- ---------------------------------------------------------------------------
-- Buffer/Window/Session
-- ---------------------------------------------------------------------------
-- kill the buffer while keep the window
Plug("moll/vim-bbye")
-- swap and split window
Plug("xorid/swap-split.nvim")

-- ---------------------------------------------------------------------------
-- ui
-- ---------------------------------------------------------------------------
-- color theme
Plug("bluz71/vim-moonfly-colors")
Plug("catppuccin/nvim")
-- let the cursor stay away from ceil and bottom
Plug("drzel/vim-scrolloff-fraction")
-- statusline
-- Plug("wkcosmology/statusline")
Plug("nvim-lualine/lualine.nvim")
-- show the vertical lines to represent the indent
Plug("lukas-reineke/indent-blankline.nvim")
-- maximum and restore current window, powerful!!!
Plug("szw/vim-maximizer")
-- pretty tab line
Plug("gcmt/taboo.vim")
-- devicons
Plug("ryanoasis/vim-devicons")
-- improve the default vim.ui interfaces
Plug("stevearc/dressing.nvim")
-- winbar
Plug("SmiteshP/nvim-navic")
-- plug
Plug("sphamba/smear-cursor.nvim")

-- ---------------------------------------------------------------------------
-- Language specific
-- ---------------------------------------------------------------------------
-- switch header and source file
Plug("p00f/clangd_extensions.nvim", { ["for"] = { "c", "cpp", "h", "hpp" } })

-- ---------------------------------------------------------------------------
-- Git
-- ---------------------------------------------------------------------------
-- show git modified line in the state column
Plug("lewis6991/gitsigns.nvim")
-- powerful git tool
Plug("tpope/vim-fugitive")
-- tree like git browser
Plug("junegunn/gv.vim", { ["on"] = "GV" })
-- github
Plug("pwntester/octo.nvim")

-- ---------------------------------------------------------------------------
-- Anxuliary
-- ---------------------------------------------------------------------------
-- useful plugin for lua
Plug("nvim-lua/plenary.nvim")
-- Great terminal tool
Plug("akinsho/toggleterm.nvim")
-- add head information
Plug("alpertuna/vim-header", { ["on"] = "AddHeader" })
-- vimtex
Plug("lervag/vimtex")
Plug("micangl/cmp-vimtex")
-- treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-textobjects", { ["branch"] = "main" })
-- filetree in lua
Plug("MunifTanjim/nui.nvim")
Plug("nvim-neo-tree/neo-tree.nvim", { ["branch"] = "v2.x" })
Plug("karb94/neoscroll.nvim")
-- generating document
Plug("danymat/neogen")
-- presentation
Plug("tjdevries/present.nvim")

-- ---------------------------------------------------------------------------
-- Lsp and related
-- ---------------------------------------------------------------------------
-- lsp config
Plug("neovim/nvim-lspconfig")
Plug("glepnir/lspsaga.nvim", { ["branch"] = "main" })
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
-- cmp related
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/nvim-cmp")
Plug("kdheepak/cmp-latex-symbols", { ["for"] = { "tex" } })
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-nvim-lua")
Plug("lukas-reineke/cmp-under-comparator")
Plug("hrsh7th/cmp-cmdline")
-- Plug("ray-x/lsp_signature.nvim")
-- lsp UI
Plug("nvim-lua/lsp-status.nvim")
Plug("onsails/lspkind-nvim")
-- diagnostic
Plug("mrbjarksen/neo-tree-diagnostics.nvim")
-- colors for diagnostics highlight
Plug("folke/lsp-colors.nvim")
-- formatter
Plug("mhartington/formatter.nvim")
Plug("stevearc/conform.nvim")

-- ---------------------------------------------------------------------------
-- Lua
-- ---------------------------------------------------------------------------
Plug("RishabhRD/popfix", { ["for"] = { "lua" } })

-- ---------------------------------------------------------------------------
-- web development
-- ---------------------------------------------------------------------------
Plug("tamago324/vim-browsersync")
Plug("tyru/open-browser.vim")
Plug("mattn/emmet-vim", { ["for"] = { "html" } })
Plug("AndrewRadev/tagalong.vim")

-- ---------------------------------------------------------------------------
-- FZF-lua
-- ---------------------------------------------------------------------------
-- fzf plugin
Plug("junegunn/fzf", { ["dir"] = "~/.fzf", ["do"] = "./install --all" })
-- fzf vim plugin
Plug("junegunn/fzf.vim")
-- fzf history
Plug("pbogut/fzf-mru.vim")
Plug("ibhagwan/fzf-lua")
Plug("elanmed/fzf-lua-frecency.nvim")
Plug("michel-garcia/fzf-lua-file-browser.nvim")

-- ---------------------------------------------------------------------------
-- Telescope and related
-- ---------------------------------------------------------------------------
Plug("nvim-lua/popup.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make CC=/opt/homebrew/bin/gcc-14" })
Plug("nvim-telescope/telescope-bibtex.nvim")
Plug("nvim-telescope/telescope-symbols.nvim")
Plug("nvim-telescope/telescope-frecency.nvim")
Plug("nvim-telescope/telescope-ui-select.nvim")
Plug("benfowler/telescope-luasnip.nvim")
Plug("tami5/sqlite.lua")
Plug("AckslD/nvim-neoclip.lua")
Plug("da-moon/telescope-toggleterm.nvim")

vim.call("plug#end")
-- end of vim plugins manager: vim-plug ---------------------------------------
-- :setlocal foldmethod=marker
