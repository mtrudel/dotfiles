return { {
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame_opts = {
      virt_text_pos = 'right_align',
      delay = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - (<abbrev_sha>) <summary>',
  },
  event = { 'BufReadPre' },
  keys = {
    { '<leader>B', function() require('gitsigns').toggle_current_line_blame() end },
  },
} }
