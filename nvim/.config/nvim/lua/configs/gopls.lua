-- ~/.config/nvim/lua/configs/gopls.lua

local lspconfig = require("lspconfig")
local lsp_common = require("configs.lsp-common")  -- подключаем общий on_attach

-- Настройка gopls
lspconfig.gopls.setup({
  cmd = {"gopls"},
  filetypes = {"go", "gomod"},
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,      -- автоформатирование
      staticcheck = true,  -- линтер
    },
  },
  on_attach = lsp_common.on_attach,  -- используем общий on_attach
})

