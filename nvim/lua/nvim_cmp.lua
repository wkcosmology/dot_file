-- Setup nvim-cmp.
local cmp = require("cmp")
local nvim_lsp = require("lspconfig")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
vim.keymap.set({ "i" }, "<C-J>", function()
  ls.expand()
end, { silent = true })

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
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
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
    { name = "nvim_lsp_signature_help" },
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

-- Attach to all the languages
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  local opts = { noremap = true, silent = true }
end

nvim_lsp["jedi_language_server"].setup({ on_attach = on_attach })
nvim_lsp["vimls"].setup({ on_attach = on_attach })
nvim_lsp["texlab"].setup({ on_attach = on_attach })
nvim_lsp["cmake"].setup({ on_attach = on_attach })
nvim_lsp["fortls"].setup({ on_attach = on_attach })
nvim_lsp["lua_ls"].setup({
  on_attach = on_attach,
  Lua = {
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { "vim" },
    },
  },
})
nvim_lsp["clangd"].setup({
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--clang-tidy",
    "--compile-commands-dir=~/.config/clang/",
    "--background-index",
    "--completion-style=detailed",
    "--all-scopes-completion",
    "--header-insertion=iwyu",
  },
  capabilities = capabilities,
})
