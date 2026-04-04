--[=[
vim.pack.add { 'nvim-neotest/neotest', 'antoinemadec/FixCursorHold.nvim', 'nvim-neotest/neotest-go', 'nvim-neotest/neotest-plenary' }

-- cmd = 'Neotest',

local nt = require 'neotest'
nt.setup {
  adapters = {
    require 'neotest-go' {
      experimental = {
        test_table = true,
      },
      args = { '-v -count=1', '-timeout=60s' },
    },
    require 'neotest-plenary',
  },
  diagnostic = {
    enabled = true,
  },
  running = {
    concurrent = false,
  },
  status = {
    enabled = true,
    virtual_text = false,
    signs = true,
  },
  strategies = {
    integrated = {
      width = 180,
    },
  },
}

vim.keymap.set('', '<leader>t', function() require('neotest').run.run() end, { desc = 'call test for function in cursor' })
vim.keymap.set('', '<leader>tt', function() require('neotest').run.run(vim.fn.expand '%') end, { desc = 'call test for current file' })
vim.keymap.set('', '<leader>tp', function() require('neotest').run.run(vim.fn.getcwd()) end, { desc = 'call test all files' })
vim.keymap.set('', '<leader>ts', function() require('neotest').summary.toggle() end, { desc = 'open/close test summary' })
vim.keymap.set('', '<leader>to', function() require('neotest').output_panel.open() end, { desc = 'open output panel' })
vim.keymap.set('', '<leader>[t', function() require('neotest').jump.prev { status = 'failed' } end, { desc = 'jump prev failed test' })
vim.keymap.set('', '<leader>]t', function() require('neotest').jump.next { status = 'failed' } end, { desc = 'jump next failed test' })

--]=]
