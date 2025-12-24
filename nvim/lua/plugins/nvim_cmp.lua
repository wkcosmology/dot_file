-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
  performance = {
    debounce = 10,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  completion = {
    -- autocomplete = false,
    completeopt = "menu,menuone,noselect",
    keyword_length = 1,
  },
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      scrollbar = false,
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
      scrollbar = true,
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  },

  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
    ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  },
  -- the order matters when the priorities are the same
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "path" },
  },
  preselect = cmp.PreselectMode.None,
  experimental = { native_menu = false, ghost_text = false },
  sorting = {
    comparators = {
      cmp.config.compare.score,
      cmp.config.compare.exact,
      cmp.config.compare.offset,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      vim_item.abbr = vim_item.abbr:gsub("•", ""):gsub("^%s+", "")
      kind.kind = "    [" .. (string.sub(strings[2], 1, 10) or "") .. "]"
      kind.menu = ""
      return kind
    end,
  },
})
-- Use cmdline & path source for ':'.
cmp.setup.cmdline("/", { sources = { { name = "buffer", keyword_length = 3 } } })
cmp.setup.cmdline("?", { sources = { { name = "buffer", keyword_length = 3 } } })
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({ { name = "path", keyword_length = 3 } }, { { name = "cmdline", keyword_length = 3 } }),
})

-- config for each language
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local navic = require("nvim-navic")

-- Attach to all the languages
local on_attach = function(client, bufnr)
  navic.attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  local opts = { noremap = true, silent = true }
end

vim.lsp.config("jedi_language_server", { on_attach = on_attach })
vim.lsp.config("vimls", { on_attach = on_attach })
vim.lsp.config("texlab", { on_attach = on_attach })
vim.lsp.config("cmake", { on_attach = on_attach })
vim.lsp.config("fortls", { on_attach = on_attach })
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  Lua = {
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { "vim" },
    },
  },
})
vim.lsp.config("clangd", {
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--clang-tidy",
    "--compile-commands-dir=" .. vim.fn.expand("~/.config/clang"),
    "--background-index",
    "--completion-style=detailed",
    "--all-scopes-completion",
    "--header-insertion=iwyu",
  },
  capabilities = capabilities,
})
vim.lsp.enable("jedi_language_server")
vim.lsp.enable("vimls")
vim.lsp.enable("texlab")
vim.lsp.enable("cmake")
vim.lsp.enable("fortls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")

-- disable spell check in hover window
vim.api.nvim_create_autocmd("WinNew", {
  callback = function()
    local win = vim.api.nvim_get_current_win()
    vim.schedule(function()
      if not vim.api.nvim_win_is_valid(win) then return end
      if vim.api.nvim_win_get_config(win).relative == "" then return end
      if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "markdown" then
        vim.wo[win].spell = false
      end
    end)
  end,
})
