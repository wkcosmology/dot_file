lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = { "tex" }
    },
    indent = {
        enable = false,
        disable = { "tex" }
    },
    textobjects = {
        select = {
          enable = true,
          keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["il"] = "@loop.inner",
                ["al"] = "@loop.outer",
            }
        }
    },
    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "\\r",
            },
            disable = {"c", "cpp", "h", "hpp"}
        },
    },
}
EOF

