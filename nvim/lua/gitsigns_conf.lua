require("gitsigns").setup {
    signs = {
        add = {hl = "GitGutterAdd", text = "+"},
        change = {hl = "GitGutterChange", text = "~"},
        delete = {hl = "GitGutterDelete", text = "-", show_count = true},
        topdelete = {hl = "GitGutterDelete", text = "-"},
        changedelete = {hl = "GitGutterChange", text = "-"}
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''}
    },
    watch_index = {
        interval = 1000
    },
    sign_priority = 6,
    status_formatter = nil, -- Use default
    count_chars = {"1", "2", "3", "4", "5", "6", "7", "8", "9", ["+"] = "N"},
}
