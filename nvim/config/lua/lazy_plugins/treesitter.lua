return { {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  opts = {
    ensure_installed = { 'c', 'query', 'vim', 'vimdoc' },
  },
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
} }
