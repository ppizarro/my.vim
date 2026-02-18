return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    cmd = 'Copilot',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false,
      },
      panel = { enabled = false },
      filetypes = {
        ['*'] = true,
      },
    },
  },
  {
    'AndreM222/copilot-lualine',
  },
}
