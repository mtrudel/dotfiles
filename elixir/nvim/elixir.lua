require('lspconfig').elixirls.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = require('mtrudel/helpers/lsp').on_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
})
