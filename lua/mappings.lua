local api, g = vim.api, vim.g

local function keymap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- system
local function set_system_mappings()
  keymap('c', 'w!!', 'w !sudo tee % >/dev/null<CR>:e!<CR><CR>')        -- write file as root
  keymap('', '<leader>sl', '<cmd>set list!<CR>')                       -- show hidden characters
  keymap('', '<C-j>', '<cmd>:bnext<CR>')                               -- buffer cycle like a vim acolyte
  keymap('', '<C-k>', '<cmd>:bprevious<CR>')                           -- buffer cycle like a vim acolyte
  keymap('n', '<C-l>', '<cmd>nohlsearch<CR>')                          -- clear search highlights
  keymap('v', 'J', ":m '>+1<CR>gv=gv")                                 -- visual block movement (up)
  keymap('v', 'K', ":m '<-2<CR>gv=gv")                                 -- visual block movement (down)
  keymap('n', 'gV', '`[v`]')                                           -- reselect the last visual block
  keymap('n', 'J', 'mzJ`z')                                            -- join lines, but keep cursor stationary
  keymap('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w')  -- split lines (reciprocal of join, J)

  keymap('n', '<leader>a', '<cmd>cclose<CR>')
end

-- telescope
local function set_telescope_mappings()
  keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>')
  keymap('n', '<C-g>', '<cmd>Telescope live_grep prompt_prefix=🔍<CR>')
  keymap('n', '<C-b>', '<cmd>Telescope buffers<CR>')
  keymap('n', '<C-h>', '<cmd>Telescope help_tags<CR>')
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

-- lsp
local function set_lsp_mappings()
  -- gopls and rust-analyzer does not yet support goto declaration
  keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  keymap('n', 'gS', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  keymap('n', 'gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

  -- Goto previous/next diagnostic warning/error
  keymap('n', 'g[', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  keymap('n', 'g]', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  keymap('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', '<c-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  --keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
end

g.mapleader = ","
g.maplocalleader = ","

set_system_mappings()
set_telescope_mappings()
set_trouble_mappings()
set_lsp_mappings()
