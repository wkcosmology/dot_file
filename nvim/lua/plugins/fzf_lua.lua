require("fzf-lua").setup({
  "ivy",
  file_icons = false,
  winopts = {
    height = 26,
    width = 1,
    row = math.floor(vim.o.lines - 28),
    border = "single",
    backdrop = 0,
    fullscreen = false,
    grep = {
      git_icons = false,
      no_ignore = true,
      hidden = false,
    },
    preview = {
      border = "single",
      wrap = false,
      vertical = "down:45%",
      horizontal = "right:50%",
      layout = "horizontal",
      title = true,
      title_pos = "center",
      scrollbar = false,
      scrolloff = -1,
      delay = 20,
      winopts = {
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

  fzf_colors = { true, ["gutter"] = "-1" },

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

  lsp = {
    prompt_postfix = "❯ ", -- will be appended to the LSP label
    -- to override use 'prompt' instead
    cwd_only = false, -- LSP/diagnostics for cwd only?
    async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
    file_icons = false,
    git_icons = false,
    jump1 = true, -- skip the UI when result is a single entry
    jump1_action = FzfLua.actions.file_edit,
    -- The equivalent of using `includeDeclaration` in lsp buf calls, e.g:
    -- :lua vim.lsp.buf.references({includeDeclaration = false})
    includeDeclaration = true, -- include current declaration in LSP context
    -- settings for 'lsp_{document|workspace|lsp_live_workspace}_symbols'
    symbols = {
      -- lsp_query      = "foo"       -- query passed to the LSP directly
      -- query          = "bar"       -- query passed to fzf prompt for fuzzy matching
      locate = false, -- attempt to position cursor at current symbol
      async_or_timeout = true, -- symbols are async by default
      symbol_style = 3, -- style for document/workspace symbols
      -- false: disable,    1: icon+kind
      --     2: icon only,  3: kind only
      -- NOTE: icons are extracted from
      -- vim.lsp.protocol.CompletionItemKind
      -- icons for symbol kind
      -- see https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#symbolKind
      -- see https://github.com/neovim/neovim/blob/829d92eca3d72a701adc6e6aa17ccd9fe2082479/runtime/lua/vim/lsp/protocol.lua#L117
      -- colorize using Treesitter '@' highlight groups ("@function", etc).
      -- or 'false' to disable highlighting
      symbol_hl = function(s)
        return "@" .. s:lower()
      end,
      -- additional symbol formatting, works with or without style
      symbol_fmt = function(s, opts)
        return "[" .. s .. "]"
      end,
      -- prefix child symbols. set to any string or `false` to disable
      child_prefix = true,
      -- prepend parent to symbol, set to any string or `false` to disable
      -- parent_postfix    = ".",
      fzf_opts = { ["--tiebreak"] = "begin" },
    },
    finder = {
      prompt = "LSP Finder> ",
      file_icons = false,
      color_icons = false,
      async = true, -- async by default
      silent = true, -- suppress "not found"
      separator = "| ", -- separator after provider prefix, `false` to disable
      includeDeclaration = true, -- include current declaration in LSP context
      -- by default display all LSP locations
      -- to customize, duplicate table and delete unwanted providers
    },
  },
})

require("fzf-lua-frecency").setup()
