-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `ultisnips` user.
      vim.fn["UltiSnips#Anon"](args.body)
    end
  },
  completion = {
    -- autocomplete = false,
    completeopt = 'menu,menuone,noselect',
    keyword_length = 2
  },
  window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  mapping = {
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping(cmp.mapping.close(), {'i', 'c'}),
    ['<C-y>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
  },
  -- the order matters when the priorities are the same
  sources = {{name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'ultisnips'}, {name = 'path'}},
  preselect = cmp.PreselectMode.None,
  experimental = {native_menu = false, ghost_text = true},
  sorting = {
    comparators = {
      cmp.config.compare.offset, cmp.config.compare.exact, cmp.config.compare.score,
      require"cmp-under-comparator".under, cmp.config.compare.kind, cmp.config.compare.sort_text,
      cmp.config.compare.length, cmp.config.compare.order
    }
  }
})

cmp.setup.cmdline('/', {sources = {{name = 'buffer', keyword_length = 3}}})

cmp.setup.cmdline('?', {sources = {{name = 'buffer', keyword_length = 3}}})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({{name = 'path', keyword_length = 3}}, {{name = 'cmdline', keyword_length = 3}}),
})
