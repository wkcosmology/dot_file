require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mapping = false,
  persist_size = false,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = "single",
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.7),
    winblend = 0,
    title_pos = "left",
    highlights = { border = "Label", background = "Label" },
  },
})

local Terminal = require("toggleterm.terminal").Terminal
local ipython = Terminal:new({ cmd = "ipython", hidden = true })
local terminal = Terminal:new()

function _ipython_toggle()
  ipython:toggle()
end
function _terminal_toggle()
  terminal:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>ti", "<cmd>lua _ipython_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _terminal_toggle()<CR>", { noremap = true, silent = true })
