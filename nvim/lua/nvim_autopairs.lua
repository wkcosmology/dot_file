-- require('nvim-autopairs').setup({disable_filetype = {"TelescopePrompt"}, enable_check_bracket_line = false})
-- local remap = vim.api.nvim_set_keymap
-- local npairs = require('nvim-autopairs')
-- -- skip it, if you use another global object
-- _G.MUtils = {}
-- MUtils.completion_confirm = function()
--   if vim.fn.pumvisible() ~= 0 then
--     return npairs.esc("<cr>")
--   else
--     return npairs.autopairs_cr()
--   end
-- end
-- remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})

-- -- add rules
-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require('nvim-autopairs')

-- npairs.add_rules({Rule("$", "$", "tex")})
