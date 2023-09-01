vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 80
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end
})
