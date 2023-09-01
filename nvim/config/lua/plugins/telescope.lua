return { {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        vertical = { width = 0.75, height = 0.9, preview_height = 0.6 },
      },
    },
  },
  keys = {
    { '<leader>b', function() require('telescope.builtin').oldfiles({ include_current_session = true, previewer = false }) end },
    { '<leader>T', function() require('telescope.builtin').git_files({ previewer = false }) end },
    { '<leader>t', function() require('telescope.builtin').find_files({ previewer = false }) end },
    { '<leader>f', function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') }) end },
  },
} }
