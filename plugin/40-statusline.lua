-- lualine
vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    globalstatus = true,
    disabled_filetypes = { statusline = { 'alpha' } },
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
    },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = {
      {
        'copilot',
        show_colors = false,
        show_loading = true,
      },
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { 'quickfix' },
}

-- end)
