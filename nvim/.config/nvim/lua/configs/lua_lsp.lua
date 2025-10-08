-- Проверяем, установлен ли lua-language-server
local lsp_common = require("configs.lsp-common")

if vim.fn.executable('lua-language-server') == 1 then
    vim.lsp.config["lua_ls"] = {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            },
        },
        on_attach = lsp_common.on_attach
    }

    -- включаем сервер
    vim.lsp.enable("lua_ls")
end
