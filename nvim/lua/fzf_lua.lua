require("fzf-lua").setup({
  "ivy",
  keymap = { ... }, -- Neovim keymaps / fzf binds
  actions = { ... }, -- Fzf "accept" binds
  fzf_opts = { ... }, -- Fzf CLI flags
  fzf_colors = { ... }, -- Fzf `--color` specification
  hls = { ... }, -- Highlights
  winopts = {
    height = 0.35, -- window height
    width = 1, -- window width
    -- border argument passthrough to nvim_open_win()
    border = "single",
    -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
    backdrop = 0,
    fullscreen = false, -- start fullscreen?
    treesitter = {
      enabled = true,
      fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
    },
    preview = {
      border = "single", -- preview border: accepts both `nvim_open_win`
      wrap = false, -- preview line wrap (fzf's 'wrap|nowrap')
      hidden = false, -- start preview hidden
      vertical = "down:45%", -- up|down:size
      horizontal = "right:50%", -- right|left:size
      layout = "horizontal", -- horizontal|vertical|flex
      flip_columns = 100, -- #cols to switch to horizontal on flex
      -- Only used with the builtin previewer:
      title = true, -- preview border title (file/buf)?
      title_pos = "center", -- left|center|right, title alignment
      scrollbar = "float", -- `false` or string:'float|border'
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

  oldfiles = {
    prompt = "History❯ ",
    cwd_only = false,
    stat_file = true, -- verify files exist on disk
    -- can also be a lua function, for example:
    -- stat_file = FzfLua.utils.file_is_readable,
    -- stat_file = function() return true end,
    include_current_session = false, -- include bufs from current session
  },
})
