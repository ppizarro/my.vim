-- buffer cycle

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("", "<leader>j", function()
  vim.cmd([[:bnext]])
end)
vim.keymap.set("", "<leader>k", function()
  vim.cmd([[:bprevious]])
end)

-- clear search highlights
vim.keymap.set("n", "<leader>,", function()
  vim.cmd([[nohlsearch]])
end)

-- quickfix shortcuts
vim.keymap.set("", "<C-n>", function()
  vim.cmd([[:cnext]])
end)
vim.keymap.set("", "<C-p>", function()
  vim.cmd([[:cprevious]])
end)
vim.keymap.set("n", "<leader>cc", function()
  vim.cmd([[cclose]])
end)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
