local saga = require("lspsaga")

-- use default config
saga.init_lsp_saga()

-- use custom config
saga.init_lsp_saga({
  border_style = "rounded",
  saga_winblend = 10,
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  -- show diagnostic source
  show_diagnostic_source = true,
  code_action_lightbulb = {
    enable = false,
    sign = false,
    enable_in_insert = false,
    sign_priority = 20,
    virtual_text = false,
  },
  -- finder icons
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
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  max_preview_lines = 30,
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  definition_preview_icon = "  ",
  symbol_in_winbar = {
    in_custom = false,
    enable = false,
    separator = " ",
    show_file = true,
    click_support = false,
  },
})

-- LSP finder
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- hover documents
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- preview definition
vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
-- signature helper
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
-- rename
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- scroll keymapping
local action = require("lspsaga.action")
vim.keymap.set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
vim.keymap.set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })
