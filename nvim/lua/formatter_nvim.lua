local util = require("formatter.util")
require("formatter").setup({
  filetype = {

    cpp = {
      -- clang-format
      function()
        return {
          exe = "clang-format",
          args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "-style", "file:/Users/wangk/.clang-format"},
          stdin = true,
          cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
        }
      end,
    },

    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      -- require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--config-path /Users/wangk/.config/stylua.toml",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },

    tex = {
      -- Configuration for psf/black
      function()
        return {
          exe = "tex-fmt --stdin --tabsize=2",
          stdin = true,
        }
      end,
    },

    python = {
      -- Configuration for psf/black
      function()
        return {
          exe = "black", -- this should be available on your $PATH
          args = { "-" },
          stdin = true,
        }
      end,
    },

    cmake = {
      function()
        return {
          exe = "cmake-format", -- this should be available on your $PATH
          args = { "-" },
          stdin = true,
        }
      end,
    },

    fortran = {
      function()
        return {
          exe = "fprettify",
          args = { "-" },
          stdin = true,
        }
      end,
    },

    markdown = {
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },
  },
})
