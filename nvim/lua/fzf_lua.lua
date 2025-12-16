require("fzf-lua").setup({
  "ivy",
  winopts = {
    height = 26,
    width = 1,
    row = math.floor(vim.o.lines - 28),
    border = { "", "─", "", "", "", "─", "", "" },
    backdrop = 0,
    fullscreen = false,
    preview = {
      border = "single", -- preview border: accepts both `nvim_open_win`
      wrap = false, -- preview line wrap (fzf's 'wrap|nowrap')
      vertical = "down:45%", -- up|down:size
      horizontal = "right:50%", -- right|left:size
      layout = "horizontal", -- horizontal|vertical|flex
      -- Only used with the builtin previewer:
      title = true, -- preview border title (file/buf)?
      title_pos = "center", -- left|center|right, title alignment
      scrollbar = false, -- `false` or string:'float|border'
      scrolloff = -1, -- float scrollbar offset from right
      delay = 20, -- delay(ms) displaying the preview
      winopts = { -- builtin previewer window options
        number = true,
        relativenumber = false,
        cursorline = true,
        cursorlineopt = "both",
        cursorcolumn = false,
        signcolumn = "no",
        list = false,
        foldenable = false,
        foldmethod = "manual",
      },
    },
    on_create = function()
      -- called once upon creation of the fzf main window
      -- can be used to add custom fzf-lua mappings, e.g:
      --   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
    end,
  },

  fzf_colors = true,

  keymap = {
    fzf = {
      ["ctrl-g"] = "abort",
      ["ctrl-f"] = "half-page-down",
      ["ctrl-b"] = "half-page-up",
    },
  },

  actions = {
    files = {
      ["enter"] = FzfLua.actions.file_edit_or_qf,
      ["ctrl-s"] = FzfLua.actions.file_split,
      ["ctrl-v"] = FzfLua.actions.file_vsplit,
    },
  },
})
