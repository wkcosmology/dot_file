-- =========================
-- VimTeX core settings
-- =========================

-- imaps
vim.g.vimtex_imaps_enabled = 1
vim.g.vimtex_imaps_disabled = { "]]" } -- cannot be disabled

-- TeX basics
vim.g.tex_flavor = "pdflatex"
vim.g.tex_conceal = ""
vim.g.vimtex_parser_bib_backend = "lua"

-- =========================
-- Compiler (latexmk)
-- =========================
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
  build_dir = "",
  callback = 1,
  continuous = 0,
  executable = "latexmk",
  hooks = {},
  options = {
    "-pdf",
    "-cd",
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
  },
}

-- =========================
-- Quickfix
-- =========================
vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_mode = 1 -- open on error
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
vim.g.vimtex_quickfix_ignore_filters = {}

-- =========================
-- Formatting / folding / conceal
-- =========================
vim.g.vimtex_format_enabled = 0

-- use vim-matchup instead of matchparen
-- vim.g.matchup_override_vimtex = 1
-- vim.g.matchup_matchparen_enabled = 1

-- folding
vim.g.vimtex_fold_enabled = 0
vim.g.vimtex_fold_manual = 0

-- disable syntax conceal
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_syntax_conceal_disable = 1

-- =========================
-- TOC configuration
-- =========================
vim.g.vimtex_toc_config = {
  name = "Table of contents (VimTeX)",
  mode = 1,
  fold_enable = 0,
  hide_line_numbers = 0,
  hotkeys_enabled = 1,
  hotkeys_leader = "",
  layer_status = {
    content = 1,
    label = 0,
    todo = 1,
    include = 0,
  },
  resize = 0,
  refresh_always = 1,
  split_width = 50,
  tocdepth = 3,
  todo_sorted = 1,
  split_pos = "vert rightbelow",
}

-- =========================
-- Auto view on successful compile
-- =========================
vim.api.nvim_create_augroup("vimtex", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "vimtex",
  pattern = "VimtexEventCompileSuccess",
  callback = function()
    vim.cmd("VimtexView")
  end,
})

-- =========================
-- Viewer (Skim)
-- =========================
vim.g.vimtex_view_enabled = 1
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_automatic = 0

vim.g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
vim.g.vimtex_view_general_options = "-r @line @pdf @tex"

vim.g.vimtex_view_skim_activate = 0
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_reading_bar = 1

-- =========================
-- Grammar (Textidote)
-- =========================
vim.g.vimtex_grammar_textidote = {
  jar = "",
  args = "",
}
