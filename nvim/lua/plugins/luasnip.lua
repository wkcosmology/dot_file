require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
local ls = require("luasnip")
-- insert mode: expand or jump if possible, otherwise <C-j>
vim.keymap.set("i", "<C-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-j>", true, false, true), "n", false)
  end
end, { silent = true })

-- select mode: jump forward and backward
vim.keymap.set("s", "<C-j>", function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
