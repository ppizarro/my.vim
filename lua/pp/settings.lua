-- [[ Setting options ]]
-- See `:help vim.o`

local g = vim.g
local o = vim.o
local wo = vim.wo

-- Skip some remote provider loading
g.loaded_python_provider = 0 -- disable Python 2 support
g.loaded_ruby_provider = 0 -- disable ruby support
g.loaded_node_provider = 0 -- disable node support
g.loaded_perl_provider = 0 -- disable perl support
g.python3_host_prog = '/usr/bin/python3' -- path to python interpreter for neovim

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
    'gzip',
    'zipPlugin',
    'zip',
    'tar',
    'tarPlugin',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    '2html_plugin',
    'matchit',
    'matchparen',
    'logiPat',
    'rrhelper',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
}

g.loaded = 1
for i = 1, 10 do
    g['loaded_' .. disabled_built_ins[i]] = 1
end

-- Tabs
o.autoindent = true
o.cindent = true
o.wrap = true

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.breakindent = true
o.showbreak = string.rep(" ", 3) -- make it so that long lines wrap smartly
o.linebreak = true

o.signcolumn = "yes" -- show sign column
wo.number = true -- show line numbers
o.relativenumber = true -- show relative line numbers

o.clipboard = "unnamedplus" -- use system copy/paste
o.hlsearch = false -- highlight search results
o.ignorecase = true -- ignore case
o.smartcase = true -- ignore case if search pattern is lowercase

o.shiftround = true -- move in multiples of shiftwidth with < and >
o.mouse = "a" -- allow mouse actions
o.laststatus = 3
o.showmode = false -- we show the mode with airline or lightline
o.splitright = true -- split vertical windows right to the current windows
o.splitbelow = true -- split horizontal windows below to the current windows
o.updatetime = 250 -- 250ms of no cursor movement to trigger CursorHold
o.cursorline = true -- highlight current line - allows you to track cursor position more easily
o.maxmempattern = 20000 -- increase max memory to show syntax highlighting for large files

o.undofile = true -- maintain undo history between sessions

o.completeopt = "menuone,noselect"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

local go_format_group = vim.api.nvim_create_augroup('GoLSPBufFormat', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        vim.lsp.buf.formatting_sync(nil, 1000)
    end,
    group = go_format_group,
    pattern = '*.go',
    desc = "Format on saving Go files"
})
