local jdtls = require("jdtls")
local lsp_common = require("configs.lsp-common")

local home = os.getenv("HOME")
local jdtls_home = os.getenv("JDTLS_HOME")  -- /opt/homebrew/opt/jdtls/libexec

local launcher_jar = vim.fn.glob(
  jdtls_home .. "/plugins/org.eclipse.equinox.launcher_*.jar"
)

local config_dir = jdtls_home .. "/config_mac"
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.loop.cwd(), ":t")

local cmd = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xms1g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens", "java.base/java.util=ALL-UNNAMED",
  "--add-opens", "java.base/java.lang=ALL-UNNAMED",
  "-jar", launcher_jar,
  "-configuration", config_dir,
  "-data", workspace_dir,
}

-- Автозапуск LSP для java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    jdtls.start_or_attach({
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git" }, { upward = true })[1]),
      on_attach = lsp_common.on_attach,
    })
  end,
})

