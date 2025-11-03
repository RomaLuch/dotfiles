-- ~/.config/nvim/lua/configs/gopls.lua

local lsp_common = require("configs.lsp-common")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod" },
  callback = function()
    vim.lsp.start({
      name = "gopls",
      cmd = { "gopls" },
      root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
      filetypes = { "go", "gomod" },
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
        },
      },
      on_attach = lsp_common.on_attach,
    })
  end,
})

