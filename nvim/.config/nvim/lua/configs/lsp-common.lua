local M = {}

function M.on_attach(client, bufnr)
  -- Настройки табов
  vim.bo[bufnr].expandtab = true
  vim.bo[bufnr].shiftwidth = 4
  vim.bo[bufnr].tabstop = 4
  vim.bo[bufnr].softtabstop = 4

  -- Общие опции для маппингов
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- LSP
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
end

return M
