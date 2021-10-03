local api, g = vim.api, vim.g

local function keymap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- system
local function set_system_mappings()
  keymap('', '<C-j>', '<cmd>:bnext<CR>')                               -- buffer cycle
  keymap('', '<C-k>', '<cmd>:bprevious<CR>')                           -- buffer cycle
  keymap('n', '<C-l>', '<cmd>nohlsearch<CR>')                          -- clear search highlights
  keymap('v', 'J', ":m '>+1<CR>gv=gv")                                 -- visual block movement (up)
  keymap('v', 'K', ":m '<-2<CR>gv=gv")                                 -- visual block movement (down)
  keymap('n', 'gV', '`[v`]')                                           -- reselect the last visual block
  keymap('n', 'J', 'mzJ`z')                                            -- join lines, but keep cursor stationary
  keymap('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w')  -- split lines (reciprocal of join, J)

  -- quickfix shortcuts
  keymap('', '<C-n>', '<cmd>:cnext<CR>')
  keymap('', '<C-m>', '<cmd>:cprevious<CR>')
  keymap('n', '<leader>a', '<cmd>cclose<CR>')
end

-- telescope
local function set_telescope_mappings()
  keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>')
  keymap('n', '<C-g>', '<cmd>Telescope live_grep prompt_prefix=🔍<CR>')
  keymap('n', '<C-b>', '<cmd>Telescope buffers<CR>')
  keymap('n', '<C-h>', '<cmd>Telescope help_tags<CR>')
end

-- vim-tree
local function set_vim_tree_mappings()
  keymap('n', '<leader>n', '<cmd>NvimTreeToggle<CR>')
end

-- trouble
local function set_trouble_mappings()
  local opts = { noremap=true, silent=true }
  keymap('n', '<leader>xx', '<cmd>Trouble<cr>', opts)
  keymap('n', '<leader>xc', '<cmd>TroubleClose<cr>', opts)
  keymap('n', '<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', opts)
  keymap('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
  keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)
  keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', opts)
  keymap('n', 'gR',         '<cmd>Trouble lsp_references<cr>', opts)
end

g.mapleader = ","
g.maplocalleader = ","

set_system_mappings()
set_telescope_mappings()
set_vim_tree_mappings()
set_trouble_mappings()
