return { {
  'ruifm/gitlinker.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    opts = {
      print_url = false,
    },
    mappings = false,
  },
  keys = {
    { '<leader>hb', function() require('gitlinker').get_buf_range_url('n', {action_callback = require('gitlinker.actions').open_in_browser}) end },
    { '<leader>hb', function() require('gitlinker').get_buf_range_url('v', {action_callback = require('gitlinker.actions').open_in_browser}) end, mode = 'v' },
  },
} }
