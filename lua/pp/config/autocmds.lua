-- Check if we need to reload the file when it changed
--vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("pp-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
