require('lspconfig').lua_ls.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = require('mtrudel/helpers/lsp').on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
