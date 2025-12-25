local function fname(ctx)
  local f = (ctx and ctx.filename) or vim.api.nvim_buf_get_name(0)
  if not f or f == "" then
    return vim.fn.getcwd() .. "/.conform_dummy"
  end
  return f
end

require("conform").setup({
  formatters_by_ft = {
    cpp = { "clang_format" },
    lua = { "stylua" },
    tex = { "latexindent" },
    python = { "black" },
    cmake = { "cmake_format" },
    fortran = { "fprettify" },
    markdown = { "prettierd" },
    html = { "prettierd" },
  },

  formatters = {
    clang_format = {
      command = "clang-format",
      stdin = true,
      cwd = function(ctx)
        return vim.fn.fnamemodify(fname(ctx), ":p:h")
      end,
      args = function(ctx)
        local f = fname(ctx)
        return { "--assume-filename", f, "-style", "file:/Users/wangk/.clang-format" }
      end,
    },

    stylua = {
      command = "stylua",
      stdin = true,
      args = function(ctx)
        local f = fname(ctx)
        return {
          "--search-parent-directories",
          "--config-path",
          "/Users/wangk/.config/stylua.toml",
          "--stdin-filepath",
          f,
          "--",
          "-",
        }
      end,
    },

    latexindent = {
      command = "latexindent",
      args = {
        "-g=/dev/null",
        "-y=defaultIndent:'  ',indentPreamble:1,removeTrailingWhitespace:1",
        "-l",
        "-",
      },
      stdin = true,
    },

    black = { command = "black", args = { "-" }, stdin = true },

    cmake_format = { command = "cmake-format", args = { "-" }, stdin = true },

    fprettify = { command = "fprettify", args = { "-" }, stdin = true },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>fj", function()
  require("conform").format({ async = true, lsp_fallback = false })
end, { desc = "Format buffer" })
