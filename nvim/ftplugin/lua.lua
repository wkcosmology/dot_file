local opt = vim.opt_local

opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- Don't auto-continue comments with 'o' / 'O'
opt.formatoptions:remove("o")
