vim.pack.add { 'https://github.com/m4xshen/hardtime.nvim' }

-- TODO: cmd = 'Hardtime'

require('hardtime').setup {
  restriction_mode = 'hint',
}
