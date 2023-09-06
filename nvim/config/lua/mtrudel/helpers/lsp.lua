return {
  on_attach = function(_, bufnr)
    -- Format on save
    vim.api.nvim_create_autocmd('BufWritePre', { buffer = bufnr, callback = function() vim.lsp.buf.format() end })

    -- buffer-local keymaps
    local opts = { buffer = bufnr }
    vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end
}
