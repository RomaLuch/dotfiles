-- ~/.config/nvim/lua/configs/jdtls.lua

local lsp_common = require("configs.lsp-common")

local eclipse_profile = os.getenv("HOME") .. "/.config/nvim/java-google-format.xml"

local root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'mvnw', 'gradlew' }, { upward = true })[1])
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls_home = os.getenv("JDTLS_HOME")
local jdtls_cmd = jdtls_home .. "/bin/jdtls"

-- Автозапуск LSP только для Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    -- Старт LSP
    vim.lsp.start({
      name = "jdtls",
      cmd = { jdtls_cmd, "-data", workspace_dir },
      root_dir = root_dir,
      settings = {
        java = {
          format = {
            enabled = true,
            settings = {
              url = eclipse_profile,
              profile = "CustomJava"
            }
          }
        }
      },
      init_options = { bundles = {} },

      on_attach = lsp_common.on_attach
        -- Настройки табов
    })
  end
})
