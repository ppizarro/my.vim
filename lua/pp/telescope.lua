local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({prompt_prefix='🔍'}) end)
vim.keymap.set('n', '<leader>fb',  builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>gc', builtin.git_commits)
vim.keymap.set('n', '<leader>gs', builtin.git_status)