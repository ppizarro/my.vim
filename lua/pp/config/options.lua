-- Setting options
-- See `:help vim.o`

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Skip some remote provider loading
--vim.g.loaded_python3_provider = 0 -- disable Python 3 support
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_ruby_provider = 0 -- disable ruby support
--vim.g.loaded_node_provider = 0 -- disable node support
vim.g.loaded_perl_provider = 0 -- disable perl support

vim.o.autowrite = true -- enable auto write

-- Sync clipboard between OS and Neovim. --  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = "unnamedplus" -- sync with system clipboard
end)

vim.o.cmdheight = 1
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 3 -- Hide * markup for bold and italic
vim.o.confirm = true -- confirm to save changes before exiting modified buffer
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.formatoptions = "jcroqlnt" -- tcqj
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.hidden = true -- Enable modified buffers in background
vim.o.ignorecase = true -- Ignore case
vim.o.inccommand = "split" -- preview incremental substitute
vim.o.joinspaces = false -- No double spaces with join after a dot
vim.o.laststatus = 3
vim.o.list = true -- Show some invisible characters (tabs...
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.mouse = "a" -- enable mouse mode
vim.o.number = true -- Print line number
vim.o.pumblend = 10 -- Popup blend
vim.o.pumheight = 10 -- Maximum number of entries in a popup
vim.o.relativenumber = true -- Relative line numbers
vim.o.scrolloff = 10 -- Lines of context
vim.oessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.shiftround = true -- Round indent, move in multiples of shiftwidth with < and >
vim.o.shiftwidth = 4 -- Size of an indent
vim.o.showmode = false -- dont show mode since we have a statusline
vim.o.sidescrolloff = 8 -- Columns of context
vim.o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.tabstop = 4 -- Number of spaces tabs count for
vim.o.softtabstop = 4
vim.o.termguicolors = true -- True color support
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.o.undofile = true -- maintain undo history between sessions
vim.o.undolevels = 10000
vim.o.updatetime = 250 -- save swap file and trigger CursorHold
vim.o.wildmode = "longest:full,full" -- Command-line completion mode

vim.o.wrap = true -- Disable line wrap
vim.o.cindent = true
vim.o.breakindent = true -- Enable break indent
vim.o.showbreak = string.rep(" ", 3) -- make it so that long lines wrap smartly
vim.o.linebreak = true

vim.o.swapfile = false
vim.o.backup = false

vim.o.hlsearch = true -- highlight search results
vim.o.incsearch = true

vim.o.colorcolumn = "120"

vim.o.maxmempattern = 20000 -- increase max memory to show syntax highlighting for large files

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.o.splitkeep = "screen"
  vim.o.shortmess = "filnxtToOFWIcC"
end

vim.o.winborder = "rounded" -- border style for floating windows

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.cmd.hi("Comment gui=none")

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
