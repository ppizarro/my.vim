-- Setting options
-- See `:help vim.opt`

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Skip some remote provider loading
--vim.g.loaded_python3_provider = 0 -- disable Python 3 support
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_ruby_provider = 0 -- disable ruby support
--vim.g.loaded_node_provider = 0 -- disable node support
vim.g.loaded_perl_provider = 0 -- disable perl support

vim.opt.autowrite = true -- enable auto write

-- Sync clipboard between OS and Neovim. --  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
end)

vim.opt.cmdheight = 1
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "split" -- preview incremental substitute
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.laststatus = 3
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.mouse = "a" -- enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 10 -- Lines of context
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.shiftround = true -- Round indent, move in multiples of shiftwidth with < and >
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.undofile = true -- maintain undo history between sessions
vim.opt.undolevels = 10000
vim.opt.updatetime = 250 -- save swap file and trigger CursorHold
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

vim.opt.wrap = true -- Disable line wrap
vim.opt.cindent = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- make it so that long lines wrap smartly
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true

vim.opt.colorcolumn = "120"

vim.opt.maxmempattern = 20000 -- increase max memory to show syntax highlighting for large files

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.o.shortmess = "filnxtToOFWIcC"
end

vim.o.winborder = "rounded" -- border style for floating windows

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.cmd.hi("Comment gui=none")
