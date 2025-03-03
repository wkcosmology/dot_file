local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local utils = require("telescope.utils")
local pickers = require("telescope.pickers")
local telescope_script = require("telescope_script")

require("telescope").setup({
  defaults = require("telescope.themes").get_ivy({
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
        -- scroll
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        -- scroll preview
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-h>"] = actions.preview_scrolling_left,
        ["<C-l>"] = actions.preview_scrolling_right,
        -- history
        ["<C-j>"] = require("telescope.actions").cycle_history_next,
        ["<C-k>"] = require("telescope.actions").cycle_history_prev,
        -- split
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        -- selection
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- insert word or file
        ["<C-r><C-w>"] = actions.insert_original_cword,
        ["<C-r><C-a>"] = actions.insert_original_cWORD,
        ["<C-r><C-f>"] = actions.insert_original_cfile,
        ["<C-r><C-l>"] = actions.insert_original_cline,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=auto",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--field-context-separator=-",
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    results_title = "Results",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    file_ignore_patterns = {},
    winblend = 0,
    color_devicons = false,
    -- use_less = true,
    path_display = { "truncate" },
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  }),
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      theme = "ivy",
      prompt_path = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
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
Telescope.load_extension("file_browser")
Telescope.load_extension("ui-select")
Telescope.load_extension("fzf_mru")
