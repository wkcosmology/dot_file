require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "jedi_language_server",
    "vimls",
    "texlab",
    "clangd",
    "fortls",
    "cmake",
  },
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
  virtual_text = false,
  -- virtual_text = { spacing = 4, prefix = "●", severity_limit = "Warning" },
  -- signs = { vim.diagnostic.severity = "Warning" },
  update_in_insert = false,
})
local signs = { Error = "X", Warn = "!", Hint = "", Info = "" }
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
  border = "single",
  title = true,
  saga_winblend = 0,
  max_preview_lines = 10,
  code_action_num_shortcut = true,
  beacon = {
    enable = true,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  diagnostic = {
    max_height = 0.8,
    keys = {
      quit = { "q", "<ESC>" },
    },
  },
  hover = {
    max_width = 0.9,
    max_height = 0.8,
    open_link = "gx",
  },
  lightbulb = {
    enable = false,
    virtual_text = false,
  },
  finder = {
    max_height = 0.5,
    left_width = 0.3,
    right_width = 0.3,
    layout = "float",
    keys = {
      edit = "o",
      vsplit = "v",
      split = "s",
      quit = { "<C-g>", "<C-c>", "q" },
    },
  },
  symbol_in_winbar = {
    enable = false,
    separator = " › ",
    show_file = false,
    folder_level = 0,
  },
  definition_action_keys = {
    edit = "o",
    vsplit = "v",
    split = "s",
    quit = { "<C-g>", "<C-c>" },
  },
  rename = {
    in_select = false,
    quit = "<C-c>",
  },
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    auto_enter = true,
    auto_close = true,
    auto_preview = false,
    close_after_jump = true,
    virt_text = "┃",
    jump_key = "o",
    auto_refresh = true,
    keys = {
      toggle_or_jump = "o",
      quit = "q",
    },
  },
  custom_kind = {
    Field = { "F", "#000000" },
    Method = { "M" },
  },
})
