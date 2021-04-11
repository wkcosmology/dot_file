M = {}

-- toggle git diff in fugitive plugin
function M.toggle_git_diff()
  if vim.fn["FugitiveHead"]() == "" then
    print("This is not a git repo!")
    return
  end
  local opened = false
  for _, v in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(v) and string.sub(vim.fn.bufname(v), 1, 12) == "fugitive:///" then
      opened = true
      vim.api.nvim_buf_delete(v, {force = false, unload = false})
    end
  end
  if opened == false then
    if M.git_if_in_merge() then
      vim.api.nvim_command("Gvdiffsplit!")
    else
      vim.api.nvim_command("Gvdiffsplit HEAD~0:%")
    end
  end
end

local luv = vim.loop
function M.next_file(shift, reversed)
  -- format the arguments
  shift = shift or 0
  reversed = reversed or false
  if shift == 0 then return end
  -- scan the directory
  local cur_cwd = vim.fn.expand("%:p:h")
  local cur_file = vim.fn.expand("%:t")
  local des_file = nil
  local handler = luv.fs_scandir(cur_cwd)
  local files = {}
  while true do
    local file, t = luv.fs_scandir_next(handler)
    if not file then break end
    if t == "file" then table.insert(files, file) end
  end
  -- if reversed
  if reversed then
    table.sort(files, function(a, b) return a > b end)
  else
    table.sort(files)
  end
  -- find the destination file
  local found = false
  for _, v in ipairs(files) do
    if v == cur_file then found = true end
    if found then shift = shift - 1 end
    if shift == -1 then
      des_file = v
      break
    end
  end
  if found == false or shift ~= -1 then return end
  -- return the result and execute the command
  local des_file_full = cur_cwd .. "/" .. des_file
  print("Enter file >> " .. des_file_full)
  vim.cmd("edit " .. des_file_full)
end

function M.git_clean()
  if vim.fn['FugitiveHead']() == '' then
    print("Not a git repositary!")
    return
  end
  local git_path = string.sub(vim.fn['FugitiveGitDir'](), 1, -6)
  local res = vim.fn.input("Clean the repositary of " .. git_path .. "? (Yes/No): ")
  if res == "Yes" then
    vim.fn.feedkeys(':', 'nx')
    vim.cmd("!git clean -d -f -x")
    vim.cmd("echo 'Repositary cleaned!'")
  else
    vim.fn.feedkeys(':', 'nx')
    vim.cmd("echo 'Quit the clean'")
  end
end

function M.git_if_in_merge()
  if vim.fn['FugitiveHead']() == '' then
    print("Not a git repositary!")
    return 0
  else
    return vim.fn['filereadable'](vim.fn["FugitiveGitDir"]() .. "/MERGE_HEAD")
  end
end

return M
