-- =========================
-- Compilation and viewing
-- =========================
local map = vim.keymap.set

map("n", "<leader>ee", "<cmd>write | VimtexCompile<cr>", { buffer = true, noremap = true, silent = true })
map("n", "<leader>vv", "<cmd>VimtexView<cr>", { buffer = true, noremap = true, silent = true })
map("n", "<leader>vc", "<cmd>VimtexTocOpen<cr>", { buffer = true, noremap = true, silent = true })
map("n", "<leader>cc", "<cmd>VimtexClean<cr>", { buffer = true, noremap = true, silent = true })

-- =========================
-- Buffer-local options
-- =========================
local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.textwidth = 0
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.list = false
opt.showbreak = "↪ "

-- =========================
-- Screen-line movement
-- =========================
vim.keymap.set("n", "j", function()
  return vim.v.count > 0 and "j" or "gj"
end, { expr = true, buffer = true })

vim.keymap.set("n", "k", function()
  return vim.v.count > 0 and "k" or "gk"
end, { expr = true, buffer = true })

-- =========================
-- Formatting behavior
-- =========================
opt.formatoptions:append("t")
opt.formatoptions:remove("l")
-- Don't auto-continue comments
opt.formatoptions:remove({ "r", "o" })

-- =========================
-- neoscroll integration
-- =========================
local ok, neoscroll = pcall(require, "neoscroll")
if not ok then
  return
end

vim.keymap.set("n", "<C-d>", function()
  local n = (vim.v.count > 0) and vim.v.count or 40
  neoscroll.scroll(n, { move_cursor = true, duration = 250 })
end, { buffer = true, silent = true })

vim.keymap.set("n", "<C-u>", function()
  local n = (vim.v.count > 0) and vim.v.count or 40
  neoscroll.scroll(-n, { move_cursor = true, duration = 250 })
end, { buffer = true, silent = true })
