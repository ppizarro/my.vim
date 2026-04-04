-- Highlight todo, notes, etc in comments
vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }

-- TODO:  event = 'VimEnter'

---@module 'todo-comments'
---@type TodoOptions
---@diagnostic disable-next-line: missing-fields
require('todo-comments').setup { signs = false }
