return { {
  'maxmx03/solarized.nvim',
  tag = "v3.0.0",
  lazy = false,
  priority = 1000,
  config = function()
    require('solarized').setup({
      styles = {
        comments = { italic = false },
        keywords = { bold = false },
        functions = { bold = false },
      },
    })

    vim.o.background = 'light'
    vim.cmd.colorscheme 'solarized'
  end,
} }
