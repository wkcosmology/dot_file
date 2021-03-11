local M = {}
M.__index = M

-- find_files: current buffer or the git repo
function M.telescope_files()
  local opt = {}
  local buf_path = vim.fn.expand("%:p:h")

  if buf_path == "/Users/wangk" then
    print("Do not grep in home directory!")
    return nil
  end

  opt.cwd = buf_path
  if vim.fn["fugitive#head"]() ~= "" then
    require("telescope.builtin").git_files(opt)
  else
    require("telescope.builtin").find_files(opt)
  end
end

-- git branches
function M.telescope_git_branches()
  if vim.fn["FugitiveHead"]() == "" then
    print("This is not a git repo!")
    return
  end
  local repo = vim.fn["FugitiveGitDir"]()
  repo = string.match(repo, "/([^/]+)/.git$")
  opt = {prompt_prefix = " " .. repo .. " > "}
  require("telescope.builtin").git_branches(opt)
end

-- grep input string from the git repo or the current path
function M.telescope_grep_string(str)
  local opt = {}
  local buf_path = vim.fn.expand("%:p:h")
  if buf_path == "/Users/wangk" then
    print("Do not grep in home directory!")
    return nil
  end
  if vim.fn["fugitive#head"]() ~= "" then
    local cmd = "cd " .. buf_path .. " && git rev-parse --show-toplevel 2> /dev/null"
    opt.cwd = string.sub(vim.fn["system"](cmd), 1, -2)
  else
    opt.cwd = buf_path
  end

  opt.search = str or vim.fn.input("Grep For > ")
  if opt.search == "" then
    return nil
  end
  require("telescope.builtin").grep_string(opt)
end

-- grep word under cursor in the project
function M.telescope_grep_current_string()
  local str = vim.fn.expand("<cword>")
  M.telescope_grep_string(str)
end

return M
