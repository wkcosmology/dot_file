local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local utils = require("telescope.utils")
local pickers = require("telescope.pickers")
local telescope_script = require("telescope_script")

require("telescope").setup({
  defaults = {
    mappings = {
      i = { ["<C-q>"] = actions.send_to_qflist },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = { height = 60, width = 200 },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 30,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    border_hl = "Normal",
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      theme = "ivy",
      prompt_path = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
    frecency = {
      auto_validate = true,
    },
  },
})

local Telescope = require("telescope")
Telescope.load_extension("bibtex")
Telescope.load_extension("octo")
Telescope.load_extension("luasnip")
Telescope.load_extension("fzf")
Telescope.load_extension("project")
Telescope.load_extension("neoclip")
Telescope.load_extension("frecency")
Telescope.load_extension("file_browser")
Telescope.load_extension("ui-select")
