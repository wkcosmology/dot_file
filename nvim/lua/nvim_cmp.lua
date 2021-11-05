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
         luasnip = '[snip]',
         buffer = '[Buf]',
         nvim_lua = '[Lua]',
         path = '[path]',
         calc = '[calc]',
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
     ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c'}),
     ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c'}),
     ['<C-e>'] = cmp.mapping(cmp.mapping.close(), { 'i', 'c' }),
     ['<C-y>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
   },
   -- the order matters when the priorities are the same
   sources = {{name = 'nvim_lsp'}, {name = 'ultisnips'}, {name = 'path'}},
   preselect = cmp.PreselectMode.None,
   experimental = {native_menu = false, ghost_text = true},
   sorting = {
     comparators = {
       cmp.config.compare.offset,
       cmp.config.compare.exact,
       cmp.config.compare.score,
       require "cmp-under-comparator".under,
       cmp.config.compare.kind,
       cmp.config.compare.sort_text,
       cmp.config.compare.length,
       cmp.config.compare.order,
     },
     },
 })

 cmp.setup.cmdline('/', {
   sources = {
     { name = 'buffer' , keyword_length = 3 },
   },
 })

 cmp.setup.cmdline('?', {
   sources = {
     { name = 'buffer' , keyword_length = 3 },
   },
 })

 -- Use cmdline & path source for ':'.
 cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' , keyword_length = 3 },
  }, {
    { name = 'cmdline', keyword_length = 3 },
  })
})
