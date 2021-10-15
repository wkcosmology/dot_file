-- Setup nvim-cmp.
local cmp = require 'cmp'

local cmp_kinds = {
  Class = ' ',
  Color = ' ',
  Constant = 'ﲀ ',
  Constructor = ' ',
  Enum = '練',
  EnumMember = ' ',
  Event = ' ',
  Field = ' ',
  File = '',
  Folder = ' ',
  Function = ' ',
  Interface = 'ﰮ ',
  Keyword = ' ',
  Method = ' ',
  Module = ' ',
  Operator = '',
  Property = ' ',
  Reference = ' ',
  Snippet = ' ',
  Struct = ' ',
  Text = ' ',
  TypeParameter = ' ',
  Unit = '塞',
  Value = ' ',
  Variable = ' '
}

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `ultisnips` user.
      vim.fn["UltiSnips#Anon"](args.body)
    end
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snp]',
        buffer = '[Buf]',
        nvim_lua = '[Lua]',
        path = '[Pth]',
        calc = '[Clc]',
        emoji = '[Emj]'
      })[entry.source.name]
      return vim_item
    end
  },
  completion = {
    -- autocomplete = false,
    keyword_length = 2,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({select = true})
  },
  sources = {
    {name = 'nvim_lsp'}, -- For ultisnips user.
    {name = 'ultisnips'}, {name = 'buffer'}
  }
})

-- -- Setup lspconfig.
-- require('lspconfig').clangd.setup {
-- }
