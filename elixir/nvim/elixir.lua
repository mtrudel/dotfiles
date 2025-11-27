vim.lsp.config('expert', {
  on_attach = require('mtrudel/helpers/lsp').on_attach,
  cmd = { 'expert', '--stdio' },
  root_markers = { 'mix.exs', '.git' },
  filetypes = { 'elixir', 'eelixir', 'heex' },
})

vim.lsp.enable 'expert'
