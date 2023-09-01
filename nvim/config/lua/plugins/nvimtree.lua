return { {
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup({
      reload_on_bufenter = true,
      renderer = {
        highlight_git = true,
        icons = {
          git_placement = 'after',
        },
      },
    })

    vim.api.nvim_create_autocmd('QuitPre', {
      callback = function()
        vim.cmd.NvimTreeClose()
      end
    })
  end,
  keys = {
    { '<leader>1', vim.cmd.NvimTreeToggle },
    { '<leader>j', vim.cmd.NvimTreeFindFileToggle },
  },
} }
