vim.pack.add { 'https://github.com/rmagatti/auto-session' }

---enables autocomplete for opts
---@module "auto-session"
---@type AutoSession.Config
require('auto-session').setup {
  allowed_dirs = { '~/code/*', '~/code/*/*' },
}

-- Will use Telescope if installed or a vim.ui.select picker otherwise
vim.keymap.set('', '<leader>wr', '<cmd>AutoSession search<CR>', { desc = 'Session search' })
vim.keymap.set('', '<leader>ws', '<cmd>AutoSession save<CR>', { desc = 'Save session' })
vim.keymap.set('', '<leader>wa', '<cmd>AutoSession toggle<CR>', { desc = 'Toggle autosave' })
