# Introduction

My init.vim configuration, plugins and some other vim useful stuff.

# Installation

 - neovim >= 0.10
```bash
sudo pacman -S neovim
```
Emoji fonts (Ubuntu only, and only if you want emoji!) `sudo apt install fonts-noto-color-emoji`

Clone the project in $XDG_CONFIG_HOME/nvim folder, usually `~/.config/nvim`:

```bash
git clone https://github.com/ppizarro/my.vim ~/.config/nvim
```

# Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) - lazy.nvim is a modern plugin manager for Neovim

- [nightfox](https://github.com/EdenEast/nightfox.nvim) - colorscheme

- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - web devicons for general usage

- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - statusline

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Show git signs in buffer

- [telescope.nvim](https://github.com/nvim-lua/telescope.nvim) - Find, filter, preview and pick using a nice UI
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - fzf-native is a c port of fzf 

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter-based highlighting 
- [treesitter playground](https://github.com/nvim-treesitter/playground) - View treesitter information directly in Neovim!
- [treesitter textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Syntax aware text-objects, select, move, swap, and peek support

- [mason.nvim](https://github.com/williamboman/mason.nvim) - Easily install and manage LSP servers, DAP servers, linters, and formatters
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easy default configs for the builtin LSP client
- [null-ls.nvim](https://github.com/nvimtools/none-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for Neovim written in Lua
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Snippet engine

- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) -  Neo-tree is a Neovim plugin to browse the file system

- [neo-test](https://github.com/nvim-neotest/neotest) - A framework for interacting with tests within Neovim
- [neotest-go](https://github.com/nvim-neotest/neotest-go) - This plugin provides a go(lang) adapter for the Neotest framework

- [lazydev.nvim](https://github.com/folke/lazydev.nvim) - Lua development plugin

- [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) - A Neovim plugin helping you establish good command workflow and habit

# Basic Usage

## Buffer
```help
`:ls`          returns information about each buffer
`<leader>j`    :bnext
`<leader>k`    :bprevious
`:bn`          switch to the next buffer
`:bp`          switch to the previous buffer
`:b<number>`   switch to buffer number <number>
`:badd <file>` open file in a hidden buffer
`:e <file>`    open file in a new buffer and do it current
`:bd <number>` delete the buffer - also takes buffer numbers as arguments
`:ball`        open all buffers into windows
`c-6`          switch to alternate buffer
```

## Search
```help
`<leader>l` :nohlsearch -- clear search highlights
```

## Quickfix
```help
`<C-n>`     :cnext
`<C-p>`     :cprevious
`<leader>a` :cclose
```

# Telescope
```help
`<leader>sf` find_files
`<leader>sg` live_grep
`<leader>sb` buffers
`<leader>sh` help_tags
`<leader>gc` git_commits
`<leader>gs` git_status
```

# LSP
```help
`<c-]>` go to definition
`gd`    go to definition
`gi`    go to implementation
`gr`    go to references
`gD`    go to declaration

`<leader>rn` rename
`<leader>ca` code action
`<leader>D` Type Definition
`<leader>ds` Document Symbols
`<leader>ws` Workspace Symbols
`<leader>wa` Workspace Add Folder
`<leader>wr` Workspace Remove Folder
`<leader>wl` Workspace List Folder
```

## jump diagnostic
```help
`[d`        go to previous diagnostic warning/error
`]d`        go to next diagnostic warning/error
`<C-w>d`    show diagnostic error messages
`<leader>q` set loc list with warnings/errors
```

## signature
```help
`K`     hover
`<c-s>` signature
```

# nvim-tree
```help
`\` tree toggle
```

# Completion
```help
`<C-Space>` complete
`<C-d>`     scroll down
`<C-f>`     scroll up
`<C-y>`     confirm
`<C-e>`     close
`<C-k>`     next
`<C-j>`     previous
`<C-l>`     list options
```

# Comment.nvim
 - normal mode

```help
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gco` - Insert comment to the next line and enters INSERT mode
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode
```

 - visual mode
```help
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```

# Update

To check the current status of installed tools and/or manually install
other tools, you can run
   :Mason

You can press `g?` for help in this menu.

`mason` had to be setup earlier: to configure its options see the
`dependencies` table for `nvim-lspconfig` above.
