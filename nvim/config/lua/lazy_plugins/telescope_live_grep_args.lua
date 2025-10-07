return { {
  'nvim-telescope/telescope-live-grep-args.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('telescope').load_extension('live_grep_args')
  end,
  keys = {
    { '<leader>f', function()
      require("telescope").extensions.live_grep_args.live_grep_args({
        -- Add sortr to get results sorted by file
        vimgrep_arguments = { 'rg', '--sortr=path', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
      })
    end },
  },
} }
