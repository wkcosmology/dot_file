-- =========================================================
-- UI config (organized + concise, same behavior)
-- =========================================================

-- ---------- Options ----------
do
  local opt = vim.opt
  opt.cmdheight = 1
  opt.background = "dark"
  opt.signcolumn = "yes"
  opt.shortmess:append("c")
  opt.conceallevel = 0
  opt.termguicolors = true
  opt.shiftwidth = 4

  -- statusline / winbar
  opt.laststatus = 2
  opt.winbar = " " -- placeholder to force winbar spacing

  -- session
  opt.sessionoptions:append({ "tabpages", "globals" })

  opt.showbreak = "↳ "
end

-- ---------- Globals (plugin configs) ----------
do
  -- taboo
  vim.g.taboo_tab_format = " \u{f02b}  %N. [Default%m] "
  vim.g.taboo_renamed_tab_format = " \u{f02b}  %N. [%l%m] "

  -- undotree
  vim.g.undotree_WindowLayout = 2
  vim.g.undotree_SplitWidth = 50
  vim.g.undotree_SetFocusWhenToggle = 1
  vim.g.undotree_ShortIndicators = 1

  -- scrolloff_fraction
  vim.g.scrolloff_fraction = 0.15
end

-- ---------- Syntax ----------
vim.cmd("syntax enable")

-- ---------- Highlights ----------
do
  local hl = function(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
  end

  local set = {
    Visual = { bg = "#4A555A" },
    Pmenu = { fg = "#bab8b8", bg = "#363535" },
    TSUnderline = { bg = "NONE", underline = false },
    SwapSplitStatusLine = { fg = "#000000", bg = "#ff8383" },
    FzfLuaNormal = { fg = "#c6d0f5" },
    FzfLuaCursor = { fg = "Orange" },
    FzfLuaFzfMatch = { fg = "Orange" },
    FzfLuaTitle = { bg = "NONE" },
    FzfLuaBorder = { bg = "NONE" },
    FzfLuaFzfCursorLine = { fg = "Orange", bg = "#3b3f52" },
    FzfLuaFzfPointer = { fg = "Orange" },
    NormalFloat = { bg = "NONE" },
    FloatBorder = { bg = "NONE" },
    LspSignatureActiveParameter = { fg = "Orange", bg = "NONE", underline = false, bold = false },
    NavicSeparator = { fg = "Grey", bg = "NONE" },
    NavicText = { bg = "NONE" },
    DiagnosticUnderlineWarn = { underline = false, undercurl = false },
    DiagnosticUnderlineError = { underline = false, undercurl = false },
    CursorLineNr = { fg = "Orange", bg = "#3b3f52" },
    CursorLineSign = { bg = "#3b3f52" },
    WinSeparator = { bg = "NONE", fg = "Grey" },
  }

  local link = {
    MyTodo = "Todo",
    TelescopeNormal = "FzfLuaNormal",
    TelescopeSelection = "FzfLuaCursor",
    TelescopeSelectionCaret = "FzfLuaFzfPointer",
    TelescopeMatching = "FzfLuaMatch",
    TelescopeTitle = "FzfLuaTitle",
    TelescopeBorder = "FzfLuaBorder",
    ColorColumn = "CursorLine",
  }

  for g, s in pairs(set) do
    hl(g, s)
  end
  for g, t in pairs(link) do
    hl(g, { link = t })
  end
end

-- ---------- TODO highlighting inside comments ----------
do
  local grp = vim.api.nvim_create_augroup("vimrc_todo", { clear = true })
  vim.api.nvim_create_autocmd({ "Syntax", "FileType" }, {
    group = grp,
    callback = function()
      vim.cmd([[syntax match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/ containedin=.*Comment]])
    end,
  })
end

-- ---------- neoscroll ----------
do
  local ok, neoscroll = pcall(require, "neoscroll")
  if ok then
    require("neoscroll").setup({
      keymap = {
      -- stylua: ignore start
        ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 100 }) end,
        ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 100 }) end,
        ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 250 }) end,
        ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 250 }) end,
        ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
        ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
        ["zt"] = function() neoscroll.zt({ half_win_duration = 100 }) end,
        ["zz"] = function() neoscroll.zz({ half_win_duration = 100 }) end,
        ["zb"] = function() neoscroll.zb({ half_win_duration = 100 }) end,
        -- stylua: ignore end
      },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = true,
      cursor_scrolls_alone = true,
      duration_multiplier = 1.0,
      easing = "linear",
      pre_hook = nil,
      post_hook = nil,
      performance_mode = false,
      ignored_events = { "WinScrolled", "CursorMoved" },
    })
  end
end

-- ---------- smear-cursor ----------
do
  local ok, smear = pcall(require, "smear_cursor")
  if ok then
    smear.setup({
      smear_to_cmd = false,
      smear_between_buffers = false,
      smear_between_neighbor_lines = false,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = false,
      smear_insert_mode = false,
    })
  end
end

-- ---------- ColorColumn rule (only when window wide enough) ----------
-- do
--   local W = 121
--   local grp = vim.api.nvim_create_augroup("vimrc_colorcolumn", { clear = true })
--   vim.api.nvim_create_autocmd({ "WinEnter", "WinResized" }, {
--     group = grp,
--     callback = function()
--       vim.wo.colorcolumn = (vim.api.nvim_win_get_width(0) >= W) and "120" or ""
--     end,
--   })
-- end

-- ---------- pretties ----------
do
  vim.g["prettier#autoformat"] = 0
  vim.g["prettier#quickfix_enabled"] = 1
  vim.g["prettier#quickfix_auto_focus"] = 1

  vim.g["prettier#config#print_width"] = "80"
  vim.g["prettier#config#tab_width"] = "auto"
  vim.g["prettier#config#use_tabs"] = "false"
  vim.g["prettier#config#prose_wrap"] = "always"
end
