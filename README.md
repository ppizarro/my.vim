# Introduction

My init.vim configuration, plugins and some other vim useful stuff.

# Installation

- neovim >= 0.6
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
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip), [vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ) - Snippet engine
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Preconfigured snippets for multiple languages
- [Comment.nvim]("https://github.com/numToStr/Comment.nvim") - Smart and powerful comment plugin for neovim

- [lua-dev.nvim](https://github.com/folke/lua-dev.nvim) - Lua development plugin

# Basic Usage

## Buffer
`:ls`          returns information about each buffer
`<C-j>`        :bnext
`<C-k>`        :bprevious
`:bn`          switch to the next buffer
`:bp`          switch to the previous buffer
`:b<number>`   switch to buffer number <number>
`:badd <file>` open file in a hidden buffer
`:e <file>`    open file in a new buffer and do it current
`:bd <number>` delete the buffer - also takes buffer numbers as arguments
`:ball`        open all buffers into windows
`c-6`          switch to alternate buffer

## Search
`<C-l>` :nohlsearch -- clear search highlights

## Quickfix
`<C-n>`     :cnext
`<C-p>`     :cprevious
`<leader>a` :cclose

# Telescope
`<leader>ff` find_files
`<leader>fb` file_browser
`<leader>l`	 live_grep
`<leader>b`  buffers
`<leader>ht` help_tags
`<leader>gc` git_commits

# LSP
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

## jump diagnostic
`[e`, go to previous diagnostic warning/error
`]e`, go to previous diagnostic warning/error
`<leader>e`, quick fix list with warnings/errors

## signature
`K`     hover
`<c-s>` signature (insert mode)

# nvim-tree
`<leader>n` tree toggle

# completion
`<C-d>`     scroll down
`<C-f>`     scroll up
`<C-Space>` complete
`<C-y>`     disable
`<C-e>`     abort (insert mode), close (normal mode)
`<CR>`      confirm
`<Tab>`     next
`<S-Tab>`   previous

# Comment.nvim
 - normal mode

`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gco` - Insert comment to the next line and enters INSERT mode
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode

 - visual mode
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
