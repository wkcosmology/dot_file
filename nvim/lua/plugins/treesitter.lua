require("nvim-treesitter").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "latex", "lua", "vim", "tex" },
  },
  indent = {
    enable = false,
  },
  textobjects = {
    select = {
      enable = false,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
      },
    },
  },
})
--
-- for issue https://github.com/nvim-treesitter/nvim-treesitter/issues/78
-- require "nvim-treesitter.highlight"
-- local hlmap = vim.treesitter.highlighter.hl_map
-- hlmap.error = nil
