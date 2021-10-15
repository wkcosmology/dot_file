local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "\r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
nvim_lsp['jedi_language_server'].setup {on_attach = on_attach}
nvim_lsp['vimls'].setup {on_attach = on_attach}
nvim_lsp['texlab'].setup {on_attach = on_attach}
nvim_lsp['clangd'].setup {
  on_attach = on_attach,
  cmd = {
    "/usr/local/opt/llvm/bin/clangd", "--background-index", "-j=12", "--query-driver=/usr/bin/clang++",
    "--completion-style=detailed"
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- diagnostic config
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         underline = false,
--         virtual_text = false,
--         signs = true,
--         update_in_insert = false,
--     }
-- )
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- Setting for the lua lsp
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/Users/wangk/Documents/Project/library/libsource/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

require"lspconfig".sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
      }
    }
  }
}
