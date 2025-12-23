require("vimplug")
vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("filetype plugin indent on")

-- =========================================
-- Plugins
-- =========================================
require("plugins")

for _, file in ipairs(vim.fn.glob("~/.config/nvim/plugin/*.vim", true, true)) do
  vim.cmd("source " .. file)
end

-- =========================================
-- Core config (always loaded)
-- =========================================
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.ui")
require("core.commands")
