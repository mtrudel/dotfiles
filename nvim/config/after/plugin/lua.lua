vim.lsp.config('lua_ls', {
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

vim.lsp.enable('lua_ls')
