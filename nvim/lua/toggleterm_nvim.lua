require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mapping = false,
  persist_size = false,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = { "", "─", "", "", "", "─", "", "" },
    width = math.floor(vim.o.columns - 2),
    height = 25,
    row = math.floor(vim.o.lines - 29),
    winblend = 0,
    title_pos = "center",
  },
  highlights = {
    Normal = {
      guibg = "NONE",
    },
    NormalFloat = {
      link = "Normal",
    },
    FloatBorder = {
      link = "TelescopeBorder",
    },
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
