local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "IndentLine", { fg = "#626262" })
end)

require("ibl").setup({
  debounce = 100,
  indent = { char = "▍", highlight = { "IndentLine" } },
  whitespace = { remove_blankline_trail = false },
  scope = { show_start = false, show_end = false },
})
