vim.pack.add {
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/AndreM222/copilot-lualine',
}

require('copilot').setup {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    accept = false,
  },
  panel = { enabled = false },
  filetypes = {
    ['*'] = true,
  },
}
