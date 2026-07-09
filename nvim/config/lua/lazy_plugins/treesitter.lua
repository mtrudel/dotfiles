return { {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  opts = {
    auto_install = true,
    ensure_installed = { 'c', 'query', 'vim', 'vimdoc' },
    highlight = { enable = true },
    indent = { enable = true },
  },
} }
