require("formatter").setup(
  {
    filetype = {
      cpp = {
        -- clang-format
        function()
          return {
            exe = "clang-format",
            args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
            stdin = true,
            cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
          }
        end
      },
      lua = {
        -- luafmt for lua file
        function()
          return {exe = "luafmt", args = {"--indent-count", 2, "--stdin"}, stdin = true}
        end
      },
      python = {
      -- Configuration for psf/black
      function()
        return {
          exe = "black", -- this should be available on your $PATH
          args = { '-' },
          stdin = true,
        }
      end
    }
    }
  }
)