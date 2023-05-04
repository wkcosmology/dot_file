-- Setup nvim-cmp.
local cmp = require("cmp")
local nvim_lsp = require("lspconfig")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `ultisnips` user.
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  completion = {
    -- autocomplete = false,
    completeopt = "menu,menuone,noselect",
    keyword_length = 2,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
    ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  },
  -- the order matters when the priorities are the same
  sources = { { name = "nvim_lsp" }, { name = "buffer" }, { name = "ultisnips" }, { name = "path" } },
  preselect = cmp.PreselectMode.None,
  experimental = { native_menu = false, ghost_text = true },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    }),
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
  -- buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- buf_set_keymap("n", "\\r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

nvim_lsp["jedi_language_server"].setup({ on_attach = on_attach })
nvim_lsp["vimls"].setup({ on_attach = on_attach })
nvim_lsp["texlab"].setup({ on_attach = on_attach })
nvim_lsp["clangd"].setup({
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--clang-tidy",
    "--compile-commands-dir=/Users/wangk/.config/clang/",
    "--background-index",
    "--completion-style=detailed",
    "--all-scopes-completion",
    "--header-insertion=iwyu",
  },
  capabilities = capabilities,
})

-- Setting for the lua lsp
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = "/Users/wangk/MyLibrary/libsource/lua-language-server"
-- local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
-- nvim_lsp["sumneko_lua"].setup({
--   on_attach = on_attach,
--   cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = "LuaJIT",
--         -- Setup your lua path
--         path = vim.split(package.path, ";"),
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { "vim" },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = { [vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true },
--       },
--     },
--   },
-- })
