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
  local n = (vim.v.count > 0) and vim.v.count or 20
  neoscroll.scroll(n, { move_cursor = true, duration = 250 })
end, { buffer = true, silent = true })

vim.keymap.set("n", "<C-u>", function()
  local n = (vim.v.count > 0) and vim.v.count or 20
  neoscroll.scroll(-n, { move_cursor = true, duration = 250 })
end, { buffer = true, silent = true })

local hl = vim.api.nvim_set_hl
local link = function(a, b)
  hl(0, a, { link = b })
end

-- ---------------------------------------------------------
-- Commands & structure (dim)
-- ---------------------------------------------------------
link("texCmd", "Special")
link("texCmdName", "Special")
link("texCmdStyle", "Special")
link("texBeginEnd", "Comment")

-- ---------------------------------------------------------
-- Sections (stand out, but calm)
-- ---------------------------------------------------------
link("texSection", "Title")
link("texSectionName", "Title")

-- ---------------------------------------------------------
-- References & citations
-- ---------------------------------------------------------
link("texLabel", "Comment")
link("texRefZone", "Comment")
link("texRefArg", "Comment")
link("texCite", "Comment")

-- ---------------------------------------------------------
-- Math (readable, non-distracting)
-- ---------------------------------------------------------
link("texMathDelim", "Comment")
link("texMathZoneX", "Normal")
link("texMathZoneY", "Normal")

-- ---------------------------------------------------------
-- Comments
-- ---------------------------------------------------------
link("texComment", "Comment")

-- ---------------------------------------------------------
-- TODO / FIXME inside comments
-- ---------------------------------------------------------
vim.cmd([[
  syntax match MyTexTodo /\v<(TODO|FIXME|NOTE|OPTIMIZE|XXX):/
        \ containedin=texComment,vimCommentTitle
]])
link("MyTexTodo", "Todo")

-- ---------------------------------------------------------
-- disable annoying "Event" in the bibtex auto-completion
-- ---------------------------------------------------------
local cmp = require("cmp")
cmp.setup.filetype({ "tex" }, {
  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      entry_filter = function(entry)
        if entry:get_kind() == cmp.lsp.CompletionItemKind.Event then
          return false
        end
        return true
      end,
    },
    { name = "vimtex" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
  formatting = {
    format = function(entry, vim_item)
      return vim_item
    end,
  },
})
