-- Проверяем, установлен ли lua-language-server
if vim.fn.executable('lua-language-server') == 1 then
  vim.lsp.config["lua_ls"] = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
    },
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

      -- Отступы по 2 пробела
      vim.bo[bufnr].expandtab = true
      vim.bo[bufnr].shiftwidth = 2
      vim.bo[bufnr].tabstop = 2
      vim.bo[bufnr].softtabstop = 2
    end,
  }

  -- включаем сервер
  vim.lsp.enable("lua_ls")
end
