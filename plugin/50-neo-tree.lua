vim.pack.add { 'https://github.com/nvim-neo-tree/neo-tree.nvim' }

vim.g.neo_tree_remove_legacy_commands = 1

---@module 'neo-tree'
---@type neotree.Config
require('neo-tree').setup {
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    hijack_netrw_behavior = 'open_current',
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

vim.keymap.set('', '\\', '<cmd>Neotree reveal<CR>', { silent = true, desc = 'NeoTree reveal' })
