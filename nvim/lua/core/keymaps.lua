local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end
vim.g.mapleader = " "

-- ---------------------------------------------------------
-- fast editing
-- ---------------------------------------------------------
map("t", "<Esc>", [[<C-\><C-n><cr>]])
map("n", "Y", "y$")
map("x", "<leader>p", [["\_dP]])

-- vim-asterisk
map("n", "*", "<Plug>(asterisk-z*)", { remap = true })
map("n", "#", "<Plug>(asterisk-z#)", { remap = true })
map("n", "g*", "<Plug>(asterisk-gz*)", { remap = true })
map("n", "g#", "<Plug>(asterisk-gz#)", { remap = true })
vim.g["asterisk#keeppos"] = 1

-- cursor move aliases in insert/cmdline
map("i", "<C-b>", "<Left>")
map("i", "<C-f>", "<Right>")
map("c", "<C-b>", "<Left>")
map("c", "<C-f>", "<Right>")
map("c", "<C-c>", "<C-c>")

-- clear highlight
map("n", "<C-l>", "<cmd>nohlsearch<cr>")

-- select last paste area
map("n", "gV", "`[v`]", { remap = false })

-- disable command-line window
map("n", "<leader>q:", "q:")
map("n", "q:", "<Nop>")

-- resize window
map("n", "<C-w>0", "<cmd>vertical resize 120<cr>")

-- document generator
map("n", "<leader>dg", "<cmd>Neogen<cr>")

-- cd to the current path
map("n", "cd", "<cmd>CdPwd<cr>", {})

-- ---------------------------------------------------------
-- fuzzy search
-- ---------------------------------------------------------
-- seach
local fzf = require("fzf-lua")
map("n", "<leader>ss", fzf.grep)
map("n", "<leader>sw", fzf.grep_cword)
map("n", "<leader>sm", fzf.marks)
map("n", "<leader>sh", fzf.help_tags)
map("n", "<leader>s:", fzf.commands)
map("n", "<leader>sq", fzf.quickfix)
map("n", "<leader>sd", fzf.lsp_document_diagnostics)
map("n", "<leader>sD", fzf.lsp_workspace_diagnostics)
map("n", "<leader>sj", fzf.spell_suggest)
map("n", "<leader>sb", "<cmd>Telescope bibtex<cr>")
map("n", "<leader>sn", "<cmd>Telescope luasnip<cr>")
map("n", "<leader>sy", "<cmd>Telescope neoclip<cr>")
map("n", "<leader>st", "<cmd>Telescope toggleterm<cr>")
map("n", "<leader>so", "<cmd>Telescope lsp_document_symbols<cr>")
-- file
map("n", "<leader>ff", fzf.files)
map("n", "<leader>fr", "<cmd>FzfLua frecency<cr>")
map("n", "<leader>fs", "<cmd>Telescope file_browser<cr>")
map("n", "<leader>fc", function()
  require("aerial").fzf_lua_picker()
end)

local search_grp = vim.api.nvim_create_augroup("search", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = search_grp,
  pattern = { "c", "h", "cpp", "hpp", "python", "lua", "vim" },
  callback = function(ev)
    map("n", "<leader>so", "<cmd>Telescope lsp_document_symbols<cr>", { buffer = ev.buf })
  end,
})

-- ---------------------------------------------------------
-- LSP related
-- ---------------------------------------------------------
map("n", "gd", "<cmd>Lspsaga goto_definition<cr>")
map("n", "gh", fzf.lsp_references)
map("n", "gr", "<cmd>Lspsaga rename<cr>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end)

-- ---------------------------------------------------------
-- F-group: files
-- ---------------------------------------------------------
map("n", "<leader>ft", "<cmd>Neotree<cr>")

-- ---------------------------------------------------------
-- B-group: buffers
-- ---------------------------------------------------------
map("n", "<leader>bb", "<cmd>Telescope buffers theme=ivy<cr>")
map("n", "<leader>bd", "<cmd>Bwipeout<cr>")
map("n", "<leader>bD", "<cmd>DeleteHiddenBuffers<cr>")
map("n", "<leader>bs", "<cmd>ClangdSwitchSourceHeader<cr>")

-- ---------------------------------------------------------
-- <C-t>-group: tabs
-- ---------------------------------------------------------
map("n", "<C-t>", "<Nop>")
map("n", "<C-t>n", ":TabooOpen ") -- keeps trailing space for args
map("n", "<C-t>r", ":TabooRename ") -- keeps trailing space for args
map("n", "<C-t>c", "<cmd>tabclose<cr>")

-- ---------------------------------------------------------
-- window related
-- ---------------------------------------------------------
map("n", "<C-w>e", "<cmd>SwapSplit<cr>")
map("n", "<C-w>m", "<cmd>MaximizerToggle<cr>")
vim.g.maximizer_set_default_mapping = 0

for i = 1, 6 do
  map("n", "<C-w>" .. i, i .. "<C-w>w")
end

local close_win = vim.api.nvim_create_augroup("close_win", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = close_win,
  pattern = { "qf", "help", "fzf", "toggleterm", "fugitive", "undotree", "fugitiveblame", "git", "gista-list" },
  callback = function(ev)
    map("t", "<C-g>", "<cmd>close<cr>", { buffer = ev.buf })
    map("i", "<C-g>", "<cmd>close<cr>", { buffer = ev.buf })
    map("n", "<C-g>", "<cmd>close<cr>", { buffer = ev.buf })
  end,
})

-- ---------------------------------------------------------
-- G-group: Git
-- ---------------------------------------------------------
map("n", "<leader>gd", function()
  require("script").toggle_git_diff()
end)
map("n", "<leader>gh", "<cmd>diffget //2<cr>")
map("n", "<leader>gl", "<cmd>diffget //3<cr>")
map("n", "<leader>gg", "<cmd>G<cr>")
map("n", "<leader>gv", "<cmd>GV<cr>")
map("n", "<leader>gm", "<cmd>Git blame<cr>")
map("n", "<leader>gP", "<cmd>Git push<cr>")
map("n", "<leader>gp", "<cmd>Git pull<cr>")
map("n", "<leader>gf", "<cmd>Git fetch<cr>")

-- ---------------------------------------------------------
-- X-group: Copy
-- ---------------------------------------------------------
-- copy full path
map("n", "<leader>xn", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify("Copied full path: " .. path, vim.log.levels.INFO)
end, { desc = "Copy full file path" })

-- copy filename only
map("n", "<leader>xf", function()
  local name = vim.fn.expand("%:t")
  vim.fn.setreg("+", name)
  vim.notify("Copied filename: " .. name, vim.log.levels.INFO)
end, { desc = "Copy filename" })

-- ---------------------------------------------------------
-- Diagnostic and Format
-- ---------------------------------------------------------
map("n", "<leader>ed", function()
  vim.diagnostic.disable()
end)
map("n", "<leader>ec", function()
  vim.diagnostic.hide()
end)
map("n", "<leader>et", "<cmd>Neotree diagnostics reveal bottom<cr>")

map("n", "gj", function()
  require("conform").format({ async = true, lsp_fallback = true })
end)

-- ---------------------------------------------------------
-- utilities
-- ---------------------------------------------------------
map("n", "<leader>ud", "<cmd>UndotreeToggle<cr>")

local ft_grp = vim.api.nvim_create_augroup("my_file_type_map", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = ft_grp,
  pattern = "lua",
  callback = function(ev)
    map("n", "<leader>ee", "<cmd>write | luafile %<cr>", { buffer = ev.buf })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = ft_grp,
  pattern = "vim",
  callback = function(ev)
    map("n", "<leader>ee", "<cmd>write | source %<cr>", { buffer = ev.buf })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = ft_grp,
  pattern = "zsh",
  callback = function(ev)
    map("n", "<leader>ee", "<cmd>write | !source ~/.zshrc<cr>", { buffer = ev.buf })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = ft_grp,
  pattern = "tex",
  callback = function(ev)
    map("n", "<leader>sb", "<cmd>Telescope bibtex<cr>", { buffer = ev.buf })
    map("n", "<leader>ee", "<cmd>write | VimtexCompile<cr>", { buffer = ev.buf })
    map("n", "<leader>vv", "<cmd>VimtexView<cr>", { buffer = ev.buf })
    map("n", "<leader>vc", "<cmd>VimtexTocOpen<cr>", { buffer = ev.buf })
    map("n", "<leader>cc", "<cmd>VimtexClean<cr>", { buffer = ev.buf })
    map("n", "<leader>so", function()
      return require("vimtex.fzf-lua").run({ layers = "l" })
    end)
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = ft_grp,
  pattern = "markdown",
  callback = function(ev)
    map("n", "<C-j>", "<Plug>(spelunker-jump-next)", { buffer = ev.buf, remap = true })
    map("n", "<C-k>", "<Plug>(spelunker-jump-prev)", { buffer = ev.buf, remap = true })
  end,
})

-- count-aware command runner (supports e.g. 3]b, 5[q, etc.)
local function cnt(cmd)
  local n = vim.v.count1
  vim.cmd((n > 1 and (n .. cmd) or cmd))
end

-- quickfix
-- stylua: ignore start
map("n", "[q", function() cnt("cprevious") end)
map("n", "]q", function() cnt("cnext") end)
map("n", "[Q", "<cmd>cfirst<cr>")
map("n", "]Q", "<cmd>clast<cr>")
map("n", "[b", function() cnt("bprevious") end)
map("n", "]b", function() cnt("bnext") end)
map("n", "[B", "<cmd>bfirst<cr>")
map("n", "]B", "<cmd>blast<cr>")
map("n", "[l", function() cnt("lprevious") end)
map("n", "]l", function() cnt("lnext") end)
map("n", "[L", "<cmd>lfirst<cr>")
map("n", "]L", "<cmd>llast<cr>")
map("n", "[t", function() cnt("tabprevious") end)
map("n", "]t", function() cnt("tabnext") end)
map("n", "[T", "<cmd>tabfirst<cr>")
map("n", "]T", "<cmd>tablast<cr>")
map("n", "[f", "<cmd>AerialPrev<cr>")
map("n", "]f", "<cmd>AerialNext<cr>")
map("n", "[<space>", function() vim.cmd("normal! m`" .. vim.v.count1 .. "O<Esc>``") end)
map("n", "]<space>", function() vim.cmd("normal! m`" .. vim.v.count1 .. "o<Esc>``") end)
-- stylua: ignore end
