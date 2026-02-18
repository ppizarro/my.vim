return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  dependencies = {
    { 'echasnovski/mini.icons', version = false },
  },
  event = 'VimEnter',
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },

    -- Document existing key chains
    spec = {
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { 'gr', group = '[G]o LSP' },
    },
  },
}
