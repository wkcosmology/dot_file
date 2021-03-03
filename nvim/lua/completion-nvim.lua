-- local chain_complete_list_cpp = {
--   default = {
--     {complete_items = {'buffers', 'snippet'}},
--     {complete_items = {'lsp'}, triggered_only = {'.', '::', '->', '<C-space>'}},
--     {complete_items = {'path'}, triggered_only = {'/'}},
--   },
--   string = {},
--   comment = {}
-- }

-- local on_attach_cpp = function()
--     require'completion'.on_attach({
--         chain_complete_list = chain_complete_list_cpp,
--     })
-- end

-- require'lspconfig'.clangd.setup{
--     cmd = { "clangd", "--completion-style=detailed"},
--     on_attach=require'completion'.on_attach
-- }
-- require'lspconfig'.jedi_language_server.setup{on_attach=require'completion'.on_attach}


-- -- disable the lsp diagnostic
-- local nvim_lsp = require'lspconfig'
-- -- vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

