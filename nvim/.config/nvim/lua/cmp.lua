local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-`>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `true` to auto-select below item.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },       -- LSP (jdtls)
    { name = 'buffer' },         -- Текст из открытых буферов
    { name = 'path' },           -- Пути в файловой системе
  }),

    -- Автоматически выделяем первый элемент при открытии
  preselect = cmp.PreselectMode.Item,
})
