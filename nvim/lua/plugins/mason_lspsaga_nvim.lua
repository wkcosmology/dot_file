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

-- border config
do
  local orig = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = vim.tbl_extend("keep", opts or {}, { border = "single" })
    return orig(contents, syntax, opts, ...)
  end
end

-- diagnostics
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  update_in_insert = false,
})

require("lsp_signature").setup({
  max_width = 80,
  bind = false,
  hint_enable = false,
  close_timeout = 4000,
  hi_parameter = "LspSignatureActiveParameter",
  always_trigger = false,
})

-- lspsaga
require("lspsaga").setup({
  border_style = "single",
  border = "single",
  title = true,
  saga_winblend = 0,
  max_preview_lines = 10,
  code_action_num_shortcut = true,
  beacon = {
    enable = true,
  },
  scroll_preview = {
    scroll_down = "<C-d>",
    scroll_up = "<C-u>",
  },
  diagnostic = {
    max_height = 0.8,
    keys = {
      quit = { "q", "<C-g>", "<ESC>" },
    },
  },
  hover = {
    max_width = 0.5,
    max_height = 0.4,
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
    quit = "<C-g>",
  },
})
