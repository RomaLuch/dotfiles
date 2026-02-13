-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local mapLeader = " "

-- 1. Подключаем плагин (так как он в pack)
vim.cmd('packadd nvim-treesitter')

-- 2. Настраиваем (используем config БЕЗ s)
local ok, ts = pcall(require, "nvim-treesitter.config")
if ok then
    ts.setup({
        highlight = { enable = true },
    })
end

-- 3. Тот самый "двигатель", который включает подсветку
-- Это лаконичная версия твоей автокоманды
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go", "gomod", "gowork", "gosum" },
    callback = function() vim.treesitter.start() end,
})

require('onedark').setup { style = 'darker' }
require('onedark').load()

require('nvim-web-devicons').setup {
    default = true; -- Включить иконки по умолчанию
}


require('configs.nvim-tree')


vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {
  noremap = true,
  silent = true
})

vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeFocus<CR>', {
  noremap = true,
  silent = true
})

require('lualine').setup()

require('configs.nvim-jdtls')
require('configs.lua_lsp')

require('configs.cmp')
require("configs.luasnip")
require("configs.gopls")

-- Настройка Telescope
require("configs.telescope")

