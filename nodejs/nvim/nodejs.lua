require('lspconfig').eslint.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true

    require('mtrudel/helpers/lsp').on_attach(client, bufnr)
  end

})
