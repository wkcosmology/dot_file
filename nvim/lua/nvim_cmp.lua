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
    keyword_length = 2
  },
  -- documentation = {border = "rounded", maxwidth = 80},
  documentation = false,
  completion = {completeopt = 'menu,menuone,noselect'},
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})
  },
  -- the order matters when the priorities are the same
  sources = {{name = 'nvim_lsp'}, {name = 'ultisnips'}, {name = 'path'}},
  preselect = cmp.PreselectMode.None,
  experimental = {native_menu = true, ghost_text = true}
})
