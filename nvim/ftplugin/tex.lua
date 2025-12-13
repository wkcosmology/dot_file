-- Wrap visually in LaTeX buffers
vim.opt_local.wrap = true
vim.opt_local.linebreak = true      -- wrap at word boundaries
vim.opt_local.breakindent = true    -- keep indentation on wrapped lines
vim.opt_local.showbreak = "↪ "      -- optional: marker for wrapped lines

-- Move by display lines when no count is given; keep normal behavior with counts
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true, silent = true })
vim.keymap.set("n", "0", "g0", { buffer = true, silent = true })
vim.keymap.set("n", "$", "g$", { buffer = true, silent = true })
vim.keymap.set("n", "^", "g^", { buffer = true, silent = true })

-- Optional: nicer search movement with wrapped lines
vim.keymap.set("n", "n", "nzzzv", { buffer = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { buffer = true, silent = true })

-- tex ftplugin
-- soft wrap
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
