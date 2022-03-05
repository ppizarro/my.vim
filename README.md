# Introduction

My init.vim configuration, plugins and some other vim useful stuff.

# Installation

- neovim >= 0.7
- npm: required by some lsp servers

```bash
sudo pacman -S neovim npm
```

Clone the project in $XDG_CONFIG_HOME/nvim folder, usually `~/.config/nvim`:

```bash
git clone https://github.com/ppizarro/my.vim ~/.config/nvim
```

# Plugins

- [tokyonight](https://github.com/folke/tokyonight.nvim) - colorscheme
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - web devicons for general usage
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - statusline

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Show git signs in buffer

- [telescope.nvim](https://github.com/nvim-lua/telescope.nvim) - Find, filter, preview and pick using a nice UI
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - fzf-native is a c port of fzf 

- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) - Easy install LSP servers
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easy default configs for the builtin LSP client
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - Better UI for LSP outputs (docs, rename, errors)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Snippet engine
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and powerful comment plugin for neovim

- [lua-dev.nvim](https://github.com/folke/lua-dev.nvim) - Lua development plugin

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
`<leader>ff` find_files
`<leader>fg` live_grep
`<leader>fb` buffers
`<leader>fh` help_tags
`<leader>gc` git_commits
`<leader>gs` git_status
```

# LSP
```help
`<c-]>` go to definition
`gd`    go to definition
`gD`    go to declaration
`gi`    go to implementation
`gt`    go to type_definition
`gr`    go to references
`gS`    go to document_symbol
`gW`    go to workspace_symbol

`<leader>rn` rename
`<leader>ca` code action
```

## jump diagnostic
```help
`[e`        go to previous diagnostic warning/error
`]e`        go to previous diagnostic warning/error
`<leader>e` quick fix list with warnings/errors
```

## signature
```help
`K`     hover
`<c-s>` signature (insert mode)
```

# nvim-tree
```help
`<leader>n` tree toggle
```

# Completion
```help
`<C-Space>` complete
`<C-d>`     scroll down
`<C-f>`     scroll up
`<C-y>`     confirm
`<CR>`      confirm
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
