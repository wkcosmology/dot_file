require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "jedi_language_server", "vimls", "texlab", "clangd" },
})

-- lspconfig
local nvim_lsp = require("lspconfig")

-- border config
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#20282E]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=#73777A guibg=#20282E]])
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  -- virtual_text = { spacing = 4, prefix = "●", severity_limit = "Warning" },
  -- signs = { vim.diagnostic.severity = "Warning" },
  update_in_insert = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
-- If we want to disable the diagnostic
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- lsp color
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981",
})

-- lspsaga
require("lspsaga").setup({
  border_style = "rounded",
  saga_winblend = 0,
  move_in_saga = { prev = "<C-p>", next = "<C-n>" },
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  max_preview_lines = 10,
  code_action_icon = "💡",
  code_action_num_shortcut = true,
  lightbulb = {
    enable = false,
  },
  finder_icons = {
    def = "  ",
    ref = "諭 ",
    link = "  ",
  },
  finder_request_timeout = 1500,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  definition_action_keys = {
    edit = "o",
    vsplit = "v",
    split = "i",
    tabe = "t",
    quit = "q",
  },
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  -- show symbols in winbar must nightly
  symbol_in_winbar = {
    in_custom = false,
    enable = false,
    separator = " ",
    show_file = true,
    click_support = false,
  },
  show_outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    auto_enter = true,
    auto_preview = false,
    virt_text = "┃",
    jump_key = "o",
    auto_refresh = true,
  },
})
