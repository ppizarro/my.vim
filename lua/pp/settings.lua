local g = vim.g
local opt = vim.opt

-- Skip some remote provider loading
g.loaded_python_provider = 0                                -- disable Python 2 support
g.loaded_ruby_provider = 0                                  -- disable ruby support
g.loaded_node_provider = 0                                  -- disable node support
g.loaded_perl_provider = 0                                  -- disable perl support
g.python3_host_prog = '/usr/bin/python'                     -- path to python interpreter for neovim

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
  'man',
}

for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end

local indent, width = 4, 120
opt.formatoptions = "crqnj"              -- automatic formatting options
opt.expandtab = true                     -- use spaces instead of tabs
opt.shiftwidth = indent                  -- size of an indent
opt.tabstop = indent                     -- number of spaces tabs count for
opt.softtabstop = indent                 -- number of spaces tabs count for
opt.smartindent = true                   -- insert indents automatically
opt.textwidth = width                    -- maximum width of text

--opt.colorcolumn = tostring(width)        -- line length marker
opt.list = false                         -- do not show invisible characters by default
opt.signcolumn = "yes"                   -- show sign column
opt.number = true                        -- show line numbers
opt.relativenumber = false               -- show relative line numbers
opt.ruler = true                         -- show the line and column numbers of the cursor

opt.guifont = "Hack Nerd Font"
opt.clipboard = "unnamedplus"            -- use system copy/paste
opt.hlsearch = true                      -- highlight search results
opt.incsearch = true                     -- show search matches as you type
opt.ignorecase = true                    -- ignore case
opt.smartcase = true                     -- ignore case if search pattern is lowercase
opt.inccommand = "nosplit"
opt.hidden = true                        -- enable modified buffers in background
opt.joinspaces = false                   -- no double spaces with join after a dot
opt.shiftround = true                    -- move in multiples of shiftwidth with < and >
--opt.wildmode = "list:longest"            -- command-line completion mode
opt.mouse = "a"                          -- allow mouse actions
opt.autochdir = false                    -- change dirs to the file in the current buff
opt.autoread = true                      -- automatically reread changed files without asking me anything
opt.laststatus = 2
opt.showcmd = true                       -- show (partial) command in status line
opt.showmatch = false                    -- do not show matching brackets by flickering
opt.showmode = false                     -- we show the mode with airline or lightline
opt.splitright = true                    -- split vertical windows right to the current windows
opt.splitbelow = true                    -- split horizontal windows below to the current windows
opt.updatetime = 500                     -- 500ms of no cursor movement to trigger CursorHold
opt.autoindent = true
opt.errorbells = false
opt.cursorline = true                    -- highlight current line - allows you to track cursor position more easily
opt.cursorcolumn = false
opt.maxmempattern = 20000                -- increase max memory to show syntax highlighting for large files
opt.lazyredraw = true                    -- wait to redraw

opt.completeopt = "menu,menuone,noselect" -- required for nvim-cmp completion
opt.shortmess = vim.o.shortmess .. "c"

opt.backup = false                       -- do not create backup files
opt.swapfile = false                     -- do not create swap files
opt.writebackup = false

--os.execute("mkdir -p ~/.local/share/nvim/undo/")
--opt.undofile = true                                           -- maintain undo history between sessions
--opt.undodir = "~/.local/share/nvim/undo/"                     -- set undo dir (required for mundo-- )

--opt.listchars = [[eol:$,tab:>-,trail:~,extends:>,precedes:<]] -- textmate-style tabstops/EOLs
