-- ~/.config/nvim/lua/configs/telescope.lua

local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "%.git/" },
    prompt_prefix = "🔍 ",
    selection_caret = "▶ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
      },
      width = 0.87,
      height = 0.80,
    },
  },
  pickers = {
    -- Можно кастомизировать отдельные пикеры позже
  },
  extensions = {
    -- Например: fzf, frecency и т.д.
  },
}

-- Горячие клавиши
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "🔍 Найти файл",  silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = "🔍 Поиск по тексту", silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers,   { desc = "📋 Открытые буферы", silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "📘 Справка", silent = true })
