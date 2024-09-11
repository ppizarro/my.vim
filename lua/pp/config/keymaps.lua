-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- buffer cycle
vim.keymap.set("", "<leader>j", function()
  vim.cmd([[:bnext]])
end)
vim.keymap.set("", "<leader>k", function()
  vim.cmd([[:bprevious]])
end)

-- close all buffers except the current one
--:%bd\|e#\|bd#<cr>\|'\"
vim.keymap.set("n", "<leader>bd", function()
  vim.cmd("%bd")
  vim.cmd("e#")
  vim.cmd("bd#")
  vim.cmd("'\"")
end)

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

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
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
