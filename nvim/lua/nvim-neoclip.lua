require('neoclip').setup({
  history = 1000,
  enable_persistant_history = true,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  filter = nil,
  preview = true,
  default_register = '"',
  content_spec_column = false,
  on_paste = {set_reg = false},
  keys = {
    i = {select = '<cr>', next = '<c-n>', previous = '<c-p>', paste = '<c-@>', custom = {}},
    n = {select = '<cr>', next = '<c-n>', previous = '<c-p>', custom = {}}
  }
})
