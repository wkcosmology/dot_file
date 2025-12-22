-- Load all plugin config modules in this directory
local dir = vim.fn.stdpath("config") .. "/lua/plugins"
for _, f in ipairs(vim.fn.glob(dir .. "/*.lua", true, true)) do
  local name = vim.fn.fnamemodify(f, ":t:r") -- filename without .lua
  if name ~= "init" then
    require("plugins." .. name)
  end
end
