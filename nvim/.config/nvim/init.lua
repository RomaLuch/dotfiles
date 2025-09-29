-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

require('nvim-web-devicons').setup {
    default = true; -- Включить иконки по умолчанию
}

require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {
  noremap = true,
  silent = true
})

require('lualine').setup()

require('configs.jdtls')
require('configs.cmp')
require("configs.luasnip")
