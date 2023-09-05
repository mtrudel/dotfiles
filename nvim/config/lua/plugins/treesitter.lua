return { {
  'nvim-treesitter/nvim-treesitter',
  build = function() vim.cmd.TSUpdateSync() end,
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = 'all',
    highlight = { enable = true },
    indent = { enable = true },  
  },
} }
