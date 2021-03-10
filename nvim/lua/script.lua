M = {}

function M.toggle_git_diff()
    if vim.fn["FugitiveHead"]() == "" then
        print("This is not a git repo!")
        return
    end
    local opened = false
    for _, v in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(v) and string.sub(vim.fn.bufname(v), 1, 12) == 'fugitive:///' then
            opened = true
            vim.api.nvim_buf_delete(v, { force=false, unload = false })
        end
    end
    if opened == false then
        vim.api.nvim_command('Gvdiffsplit HEAD~0:%')
    end
end

return M
