local navic = require("nvim-navic")

navic.setup({
  highlight = false,
  separator = " > ",
  lsp = {
    auto_attach = false,
    preference = nil,
  },
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = require("lualine.themes.catppuccin_mocha"),
    -- component_separators = { left = "", right = "" },
    component_separators = { left = "", right = "│" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "SessionLoadPost",
        "FileChangedShellPost",
        "VimResized",
        "Filetype",
        "CursorMoved",
        "CursorMovedI",
        "ModeChanged",
      },
    },
  },
  sections = {
    lualine_a = {
      function()
        return vim.api.nvim_win_get_number(0)
      end,
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_b = {
      {
        "filename",
        file_status = true,
        newfile_status = false,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = "[+]", -- Text to show when the file is modified.
          readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
          unnamed = "[No Name]", -- Text to show for unnamed buffers.
          newfile = "[New]", -- Text to show for newly created file before first write
        },
      },
    },
    lualine_c = {
      {
        "filetype",
        fmt = function(ft)
          return ft ~= "" and ("{" .. ft .. "}") or ""
        end,
        colored = false,
        icon_only = false,
        icon = false,
        icons_enabled = false,
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = "  ", warn = "  ", info = "  " },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      },
      {
        "diff",
        colored = false,
        diff_color = { added = "GitSignsAdd", modified = "GitSignsChange", removed = "GitSignsDelete" },
        symbols = { added = "  ", modified = "  ", removed = "  " },
        always_visible = true,
      },
    },
    lualine_y = {
      "progress",
      {
        "location",
        fmt = function(s)
          return s:gsub("^%s+", ""):gsub("%s+$", "")
        end,
      },
    },
    lualine_z = { "branch" },
  },
  inactive_sections = {
    lualine_a = {
      function()
        return vim.api.nvim_win_get_number(0)
      end,
    },
    lualine_b = {
      {
        "filename",
        file_status = true,
        path = 1,
        shorting_target = 40,
      },
    },
    lualine_c = {
      {
        "filetype",
        fmt = function(ft)
          return ft ~= "" and ("{" .. ft .. "}") or ""
        end,
        colored = false,
        icon_only = false,
        icon = false,
        icons_enabled = false,
      },
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {
    lualine_c = {
      {
        function()
          if navic.is_available() then
            local loc = navic.get_location()
            if loc ~= nil and loc ~= "" then
              return loc
            end
          end
          return "󰒲  LSP is sleeping..."
        end,
        color_correction = nil,
        navic_opts = nil,
      },
    },
  },
  inactive_winbar = {
    lualine_c = {
      {
        function()
          return "󰒲  LSP is sleeping..."
        end,
        color_correction = nil,
        navic_opts = nil,
      },
    },
  },
  extensions = { "fzf", "aerial", "toggleterm", "fugitive", "neo-tree" },
})
