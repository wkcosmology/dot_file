local nvim_lsp = require("lspconfig")

-- border config
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#20282E]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=#73777A guibg=#20282E]])
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = { spacing = 4, prefix = "●", severity_limit = "Warning" },
  signs = { severity_limit = "Warning" },
  update_in_insert = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
-- If we want to disable the diagnostic
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- config for each language
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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
-- local system_name
if vim.fn.has("mac") == 1 then
  System_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  System_name = "Linux"
elseif vim.fn.has("win32") == 1 then
  System_name = "Windows"
else
  print("Unsupported system for sumneko")
end
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/Users/wangk/MyLibrary/libsource/lua-language-server"
-- local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
require("lspconfig").sumneko_lua.setup({
  on_attach = on_attach,
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = { [vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true },
      },
    },
  },
})
