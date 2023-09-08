return { {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('solarized').setup({
      styles = {
        comments = { italic = false },
        keywords = { bold = false },
        functions = { bold = false },
      },
      highlights = function(colors)
        return {
          TelescopeMatching = { fg = colors.red },
        }
      end
    })

    vim.o.background = 'light'
    vim.cmd.colorscheme 'solarized'
  end,
} }
