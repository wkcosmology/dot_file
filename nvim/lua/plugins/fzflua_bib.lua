-- lua/bib_fzf.lua
local M = {}

M.config = {
  -- REQUIRED
  bibfile = nil,
  prompt = "Bib> ",
  copy_template = "%s",
  multi_joiner = ",",
  also_copy_to_plus = false,
  title_max_len = 120,
  firstauthor_max_len = 10,
  preview_window = "right:50%:wrap",
}

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function sanitize_value(s)
  if not s then
    return nil
  end
  s = s:gsub("%s+", " ")
  s = trim(s)
  s = s:gsub("[{}]", "")
  return s
end

local function ellipsize(s, max_len)
  if not s then
    return s
  end
  if not max_len or max_len <= 0 then
    return s
  end
  if #s <= max_len then
    return s
  end
  if max_len <= 1 then
    return "…"
  end
  return s:sub(1, max_len - 1) .. "…"
end

local function parse_balanced_braces(str, i0)
  local depth = 0
  local start_i = nil
  for i = i0, #str do
    local c = str:sub(i, i)
    if c == "{" then
      depth = depth + 1
      if depth == 1 then
        start_i = i + 1
      end
    elseif c == "}" then
      depth = depth - 1
      if depth == 0 and start_i then
        return str:sub(start_i, i - 1), i
      end
    end
  end
  return nil, nil
end

local function parse_quoted(str, i0)
  local out = {}
  local esc = false
  for i = i0 + 1, #str do
    local c = str:sub(i, i)
    if esc then
      out[#out + 1] = c
      esc = false
    elseif c == "\\" then
      esc = true
      out[#out + 1] = c
    elseif c == '"' then
      return table.concat(out), i
    else
      out[#out + 1] = c
    end
  end
  return nil, nil
end

local function escape_lua_pattern(s)
  return (s:gsub("([^%w])", "%%%1"))
end

local function get_field(entry, field)
  local f = escape_lua_pattern(field)
  local pat = "%f[%w_]" .. f .. "%f[^%w_]%s*=%s*"

  local s = entry:find(pat, 1)
  if not s then
    return nil
  end

  local after = entry:sub(s)
  local eqpos = after:find("=")
  if not eqpos then
    return nil
  end

  local i = eqpos + 1
  while i <= #after and after:sub(i, i):match("%s") do
    i = i + 1
  end

  local opener = after:sub(i, i)
  if opener == "{" then
    local val = parse_balanced_braces(after, i)
    return sanitize_value(val)
  elseif opener == '"' then
    local val = parse_quoted(after, i)
    return sanitize_value(val)
  else
    local token = after:sub(i):match("^([^,\r\n]+)")
    return sanitize_value(token)
  end
end

local function first_author_short(author_field)
  if not author_field then
    return "?"
  end
  local first = author_field:match("^(.-)%s+and%s+") or author_field
  first = sanitize_value(first)
  if not first then
    return "?"
  end
  local last = first:match("^([^,]+),") or first:match("(%S+)$") or first
  return last
end

local function author_has_multiple(author_field)
  if not author_field then
    return false
  end
  return author_field:find("%s+and%s+") ~= nil
end

local function read_file_lines(path)
  local ok, lines = pcall(vim.fn.readfile, path)
  if not ok then
    return nil
  end
  return lines
end

local function parse_entries_with_ranges(lines)
  local entries = {}
  local i = 1
  while i <= #lines do
    local line = lines[i]
    local key = line:match("^@%w+%s*{%s*([^,%s]+)")
    if key then
      local start_lnum = i
      local j = i
      while j <= #lines do
        if lines[j]:match("^}%s*,?%s*$") then
          break
        end
        j = j + 1
      end
      local end_lnum = math.min(j, #lines)
      local raw = table.concat(lines, "\n", start_lnum, end_lnum)
      entries[#entries + 1] = {
        key = key,
        start_lnum = start_lnum,
        end_lnum = end_lnum,
        raw = raw,
      }
      i = end_lnum + 1
    else
      i = i + 1
    end
  end
  return entries
end

local function fixed_width(s, width)
  s = s or ""
  if not width or width <= 0 then
    return s
  end

  if #s > width then
    if width <= 1 then
      return "…"
    end
    return s:sub(1, width - 1) .. "…"
  end

  -- pad to fixed width for alignment
  return s .. string.rep(" ", width - #s)
end

local function build_items(entries, bibfile, opts)
  local items = {}
  for _, e in ipairs(entries) do
    local title = get_field(e.raw, "title") or "(no title)"
    title = ellipsize(title, opts.title_max_len)

    local author = get_field(e.raw, "author")
    local year = get_field(e.raw, "year") or "????"

    local author_disp = fixed_width(first_author_short(author), opts.firstauthor_max_len)
    local title = fixed_width(title, opts.title_max_len)
    local display = string.format("(%s) %s %s [%s]", year, author_disp, title, e.key)

    -- DISPLAY \t FILE \t START \t END \t KEY
    items[#items + 1] = table.concat({
      display,
      bibfile,
      tostring(e.start_lnum),
      tostring(e.end_lnum),
      e.key,
    }, "\t")
  end
  return items
end

local function copy_to_registers(text, opts)
  vim.fn.setreg('"', text)
  if opts.also_copy_to_plus and vim.fn.has("clipboard") == 1 then
    pcall(vim.fn.setreg, "+", text)
  end
end

local function require_bibfile(opts)
  local bibfile = opts.bibfile
  if not bibfile or bibfile == "" then
    error("bib_fzf: setup({ bibfile = '...' }) is required")
  end
  return bibfile
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
  require_bibfile(M.config)
end

function M.pick(opts)
  opts = vim.tbl_deep_extend("force", M.config, opts or {})

  local bibfile = require_bibfile(opts)
  local lines = read_file_lines(bibfile)
  if not lines then
    vim.notify("bib_fzf: failed to read " .. bibfile, vim.log.levels.ERROR)
    return
  end

  local entries = parse_entries_with_ranges(lines)
  local items = build_items(entries, bibfile, opts)

  local fzf = require("fzf-lua")

  local function entry_block_from_row(row)
    local fields = vim.split(row, "\t", { plain = true })
    local file = fields[2]
    local s = tonumber(fields[3])
    local e = tonumber(fields[4])
    if not (file and s and e) then
      return nil
    end

    local src_lines = (file == bibfile) and lines or read_file_lines(file)
    if not src_lines then
      return nil
    end

    return table.concat(src_lines, "\n", s, e)
  end

  local preview_cmd = ("awk -v s={3} -v e={4} 'NR>=s && NR<=e {print}' %s"):format(vim.fn.shellescape(bibfile))

  fzf.fzf_exec(items, {
    prompt = opts.prompt,
    fzf_opts = {
      ["--delimiter"] = "\t",
      ["--with-nth"] = "1",

      -- start long lines from the beginning in the candidates list
      ["--no-hscroll"] = true,
      ["--hscroll-off"] = "0",

      -- configurable preview window size/position
      ["--preview-window"] = opts.preview_window,

      -- Preview the selected entry block.
      -- awk is robust on macOS; fzf substitutes {2} {3} {4}.
      -- Quoting "{2}" preserves paths with spaces.
      ["--preview"] = preview_cmd,
    },
    actions = {
      -- ENTER: copy full BibTeX block(s)
      ["default"] = function(selected)
        if not selected or #selected == 0 then
          return
        end

        local blocks = {}
        for _, row in ipairs(selected) do
          local block = entry_block_from_row(row)
          if block and block ~= "" then
            blocks[#blocks + 1] = block
          end
        end
        if #blocks == 0 then
          return
        end

        local payload = table.concat(blocks, "\n\n") .. "\n\n"
        copy_to_registers(payload, opts)
      end,

      -- CTRL-K: copy citekey(s)
      ["ctrl-k"] = function(selected)
        if not selected or #selected == 0 then
          return
        end

        local keys = {}
        for _, row in ipairs(selected) do
          local fields = vim.split(row, "\t", { plain = true })
          local key = fields[5]
          if key and key ~= "" then
            keys[#keys + 1] = key
          end
        end
        if #keys == 0 then
          return
        end

        local payload
        if #keys == 1 then
          payload = string.format(opts.copy_template, keys[1])
        else
          payload = string.format(opts.copy_template, table.concat(keys, opts.multi_joiner))
        end

        copy_to_registers(payload, opts)
      end,
    },
  })
end

return M
