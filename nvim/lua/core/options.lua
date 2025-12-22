-- =========================
-- Options
-- =========================
local opt = vim.opt

opt.completeopt = { "menu", "menuone", "noselect" }
opt.wrap = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
vim.cmd("filetype plugin indent on")

opt.expandtab = true
opt.hidden = true
opt.backup = false
opt.pumheight = 20
opt.ignorecase = true
opt.smartcase = true

opt.guicursor = "a:blinkon100"

opt.list = true
opt.listchars:append({ eol = "↲" })

-- =========================
-- Keymaps
-- =========================
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- junegunn/vim-easy-align
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { silent = true })

-- =========================
-- Autocmds
-- =========================
-- textwidth for C/C++
local grp_cpp = vim.api.nvim_create_augroup("CppFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = grp_cpp,
  pattern = { "*.cpp", "*.hpp", "*.c", "*.h" },
  callback = function()
    vim.opt_local.formatexpr = "" -- same effect as `setlocal formatexpr=<cr>`
    vim.opt_local.textwidth = 80
  end,
})

-- spell for tex/markdown
local grp_spell = vim.api.nvim_create_augroup("Spelling", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = grp_spell,
  pattern = { "tex", "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us", "en_gb" }
  end,
})

-- restore cursor position
local grp_keep = vim.api.nvim_create_augroup("keepcursorpos", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = grp_keep,
  pattern = "*",
  callback = function()
    local line = vim.fn.line([['"]])
    if line > 0 and line <= vim.fn.line("$") then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- =========================
-- Env / globals
-- =========================
vim.env.CC = "(which clang)" -- NOTE: this literally sets CC to the string "(which clang)"

vim.g.python3_host_prog = vim.fn.expand("~") .. "/anaconda3/bin/python3"
vim.g.python_host_prog = vim.fn.expand("~") .. "/anaconda3/bin/python"
vim.g.lua_format_config = vim.fn.expand("~") .. "/.config/nvim/lua-format"

-- vim-targets
vim.g.targets_seekRanges = "cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB"

-- alpertuna/vim-header
vim.g.header_auto_add_header = 0
vim.g.header_field_modified_timestamp = 0
vim.g.header_field_author = "Kai Wang"
vim.g.header_field_author_email = "wkcosmology@gmail.com"
vim.g.header_field_timestamp_format = "%m.%d.%Y"

-- vim-markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_conceal_code_blocks = 0

-- vim-session
vim.g.session_autosave = "no"
vim.g.session_autoload = "no"

-- smear cursor
pcall(function()
  require("smear_cursor").enabled = true
end)
