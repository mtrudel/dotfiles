local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

--- Set up Elixir LSP
local path_to_elixirls = vim.fn.expand("~/Code/elixir-ls/release/language_server.sh")

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false
    }
  }
})

lspconfig.eslint.setup({
  capabilities = capabilities,
})
