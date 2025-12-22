local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end
vim.api.nvim_create_user_command("TrimSpace", function()
  vim.cmd([[%s/\s\+$//e]])
end, {})

vim.api.nvim_create_user_command("Trash", function(opts)
  vim.cmd(
    (opts.bang and "Move! " or "Move ") .. vim.fn.expand("~/.Trash") .. (opts.bang and " | bdelete!" or " | bdelete")
  )
end, { bang = true })

vim.api.nvim_create_user_command("NormalizeSentences", function(opts)
  local r = opts.range == 0 and "%" or ("%d,%d"):format(opts.line1, opts.line2)
  vim.cmd(r .. [[s/\v([a-z0-9,])\n\s*([a-z0-9])/\1 \2/ge]])
  vim.cmd(r .. [[s/\v([.!?])\s+\ze([A-Z]|\\[A-Za-z])/\1\r/ge]])
end, { range = true })

local fug_grp = vim.api.nvim_create_augroup("my_fugitive_mapping", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = fug_grp,
  pattern = "fugitive",
  callback = function(ev)
    map("n", "fP", "<cmd>Git push --force-with-lease<cr>", { buffer = ev.buf, noremap = true })
  end,
})

local function cd_pwd()
  local head = vim.fn.FugitiveHead()
  if head == "" then
    vim.cmd("cd %:p:h")
    vim.notify("Enter path >> " .. vim.fn.expand("%:p:h"))
  else
    local dir = vim.fn.FugitiveGitDir()
    local path = tostring(dir):sub(1, -6) -- strip trailing ".git/"
    vim.cmd("cd " .. path)
    vim.notify("Enter path >> " .. path)
  end
end

vim.api.nvim_create_user_command("CdPwd", cd_pwd, {
  desc = "cd to file dir or git root (if inside repo)",
})

local function delete_hidden_buffers()
  local tpbl = {}
  for t = 1, vim.fn.tabpagenr("$") do
    vim.list_extend(tpbl, vim.fn.tabpagebuflist(t))
  end
  for b = 1, vim.fn.bufnr("$") do
    if vim.fn.bufexists(b) == 1 and not vim.tbl_contains(tpbl, b) then
      pcall(vim.cmd, "silent bwipeout! " .. b)
    end
  end
end

vim.api.nvim_create_user_command("DeleteHiddenBuffers", delete_hidden_buffers, {})

vim.api.nvim_create_user_command("TexTocFzf", function()
  local get = vim.fn["vimtex#toc#get_entries"]
  if type(get) ~= "function" then
    return vim.notify("VimTeX ToC not available", vim.log.levels.WARN)
  end

  local items, jump = {}, {}
  for _, e in ipairs(get() or {}) do
    local title = e.title
    if title and e.type == "label" then
      local lnum = tonumber(e.line or e.lnum or 1) or 1
      local file = e.file or e.filename or vim.fn.expand("%:p")
      local key = string.format("%s", title) -- no filename
      items[#items + 1] = key
      jump[key] = { file = file, lnum = lnum }
    end
  end

  require("fzf-lua").fzf_exec(items, {
    prompt = "ToC> ",
    actions = {
      ["default"] = function(sel)
        local t = jump[sel[1]]
        if not t then
          return
        end
        vim.cmd("edit " .. vim.fn.fnameescape(t.file))
        vim.api.nvim_win_set_cursor(0, { t.lnum, 0 })
      end,
    },
  })
end, {
  desc = "Fuzzy VimTeX ToC (fzf-lua)",
})
