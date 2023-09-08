return { {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      globalstatus = 3,
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = { { 'filename', path = 3 } },
      lualine_x = { 'diagnostics', { 'filetype', icon_only = true } },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    disabled_filetypes = { 'nvim-tree' },
  },
} }
