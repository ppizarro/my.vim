vim.pack.add {
  'https://github.com/zbirenbaum/copilot.lua',
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
