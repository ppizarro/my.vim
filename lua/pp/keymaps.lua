-- buffer cycle

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('', '<leader>j', function() vim.cmd [[:bnext]] end)
vim.keymap.set('', '<leader>k', function() vim.cmd [[:bprevious]] end)

-- clear search highlights
vim.keymap.set("n", "<leader>l", function() vim.cmd [[nohlsearch]] end)

-- quickfix shortcuts
vim.keymap.set('', '<C-n>', function() vim.cmd [[:cnext]] end)
vim.keymap.set('', '<C-p>', function() vim.cmd [[:cprevious]] end)
vim.keymap.set('n', '<leader>cc', function() vim.cmd [[cclose]] end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
