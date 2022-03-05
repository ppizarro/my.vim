-- buffer cycle
vim.keymap.set('', '<leader>j', function() vim.cmd [[:bnext]] end)
vim.keymap.set('', '<leader>k', function() vim.cmd [[:bprevious]] end)

-- clear search highlights
vim.keymap.set("n", "<leader>l", function() vim.cmd [[nohlsearch]] end)

-- quickfix shortcuts
vim.keymap.set('', '<C-n>', function() vim.cmd [[:cnext]] end)
vim.keymap.set('', '<C-p>', function() vim.cmd [[:cprevious]] end)
vim.keymap.set('n', '<leader>a', function() vim.cmd [[cclose]] end)
