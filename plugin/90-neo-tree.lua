-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add { { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' } }

vim.g.neo_tree_remove_legacy_commands = 1

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    -- follow_current_file = {
    --   enabled = true,
    -- },
    -- hijack_netrw_behavior = 'open_current',
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
