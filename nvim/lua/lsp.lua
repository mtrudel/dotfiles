local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(_, bufnr)
  require("cmp_nvim_lsp").update_capabilities(capabilities)
end

--- Set up Elixir LSP
local path_to_elixirls = vim.fn.expand("~/Code/elixir-ls/release/language_server.sh")

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false
    }
  }
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
