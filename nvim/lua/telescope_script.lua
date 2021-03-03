local M = {}
M.__index = M

-- find_files: current buffer 
function M.telescope_files()
    local opt = {}
    opt.cwd = vim.fn.expand('%:p:h')
    if vim.fn['fugitive#head']() ~= '' then
        require('telescope.builtin').git_files(opt)
    else
        require('telescope.builtin').find_files(opt)
    end
end
return M
