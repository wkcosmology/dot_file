local M = {}
M.__index = M

-- find_files: current buffer or the git repo
function M.files(buf_path)
  local opt = {}

  if buf_path == "~" then
    print("Do not grep in home directory!")
    return nil
  end

  if vim.fn["FugitiveHead"]() ~= "" then
    opt.cwd = string.sub(vim.fn["FugitiveGitDir"](), 1, -6)
    require("telescope.builtin").find_files(opt)
  else
    opt.cwd = buf_path
    require("telescope.builtin").find_files(opt)
  end
end

-- git branches
function M.git_branches()
  if vim.fn["FugitiveHead"]() == "" then
    print("This is not a git repo!")
    return
  end
  local repo = vim.fn["FugitiveGitDir"]()
  repo = string.match(repo, "/([^/]+)/.git$")
  local opt = { prompt_prefix = " " .. repo .. " > " }
  require("telescope.builtin").git_branches(opt)
end

-- grep input string from the git repo or the current path
function M.grep_string(str, opt)
  local opt = opt or {}
  local buf_path = vim.fn.expand("%:p:h")
  if buf_path == vim.env.HOME then
    print("Do not grep in home directory!")
    return nil
  end
  if vim.fn["FugitiveHead"]() ~= "" then
    local cmd = "cd " .. buf_path .. " && git rev-parse --show-toplevel 2> /dev/null"
    opt.cwd = string.sub(vim.fn["system"](cmd), 1, -2)
  else
    opt.cwd = buf_path
  end

  opt.search = str or vim.fn.input("Grep For > ")
  if opt.search == "" then
    return nil
  else
    require("telescope.builtin").grep_string(opt)
  end
end

-- grep word under cursor in the project
function M.grep_current_string()
  local str = "" .. vim.fn.expand("<cword>") .. ""
  M.grep_string(str, { ["word_match"] = "-w" })
end

-- wrap git status
function M.git_status()
  if vim.fn["FugitiveHead"]() == "" then
    print("Not in git repo!")
  else
    local opt = {}
    opt.cwd = string.sub(vim.fn["FugitiveGitDir"](), 1, -6)
    require("telescope.builtin").git_status(opt)
  end
end

return M
