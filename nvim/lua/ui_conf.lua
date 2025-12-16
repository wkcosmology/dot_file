require("neoscroll").setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  keymap = {
    ["<C-u>"] = function()
      neoscroll.ctrl_u({ duration = 100 })
    end,
    ["<C-d>"] = function()
      neoscroll.ctrl_d({ duration = 100 })
    end,
    ["<C-b>"] = function()
      neoscroll.ctrl_b({ duration = 250 })
    end,
    ["<C-f>"] = function()
      neoscroll.ctrl_f({ duration = 250 })
    end,
    ["<C-y>"] = function()
      neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
    end,
    ["<C-e>"] = function()
      neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
    end,
    ["zt"] = function()
      neoscroll.zt({ half_win_duration = 100 })
    end,
    ["zz"] = function()
      neoscroll.zz({ half_win_duration = 100 })
    end,
    ["zb"] = function()
      neoscroll.zb({ half_win_duration = 100 })
    end,
  },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  duration_multiplier = 1.0, -- Global duration multiplier
  easing = "linear", -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
  ignored_events = { -- Events ignored while scrolling
    "WinScrolled",
    "CursorMoved",
  },
})

require("smear_cursor").setup({
  smear_to_cmd = false,
  smear_between_buffers = false,
  smear_between_neighbor_lines = false,
  scroll_buffer_space = true,
  legacy_computing_symbols_support = false,
  smear_insert_mode = false,
})
