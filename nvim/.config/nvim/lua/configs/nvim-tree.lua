require("nvim-tree").setup({
  git = {
    ignore = false, -- не скрывать файлы из .gitignore
  },
  update_focused_file = {
    enable = true,          -- включает автоматическое обновление фокуса
    update_root = true,     -- обновляет корневую директорию, если файл вне неё
    ignore_list = {},       -- можно добавить расширения, которые не нужно отслеживать
  },
  renderer = {
    root_folder_label = false, -- не отображать корневую папку как отдельный элемент
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
    },
  },
  diagnostics = {
    enable = false,
  },
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
})


