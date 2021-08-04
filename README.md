# Introduction

My init.vim configuration, plugins and some other vim useful stuff (mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).

# Installation

- neovim >= 0.5
- npm: some lsp servers use node

```bash
sudo pacman -S neovim npm
```

Clone the project in $XDG_CONFIG_HOME/nvim folder, usually `~/.config/nvim`:

```bash
git clone https://github.com/ellisonleao/neovimfiles ~/.config/nvim
```

# Plugins

- [tokyonight](https://github.com/folke/tokyonight.nvim) - colorscheme
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - web devicons for general usage
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - statusline

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Show git signs in buffer

- [telescope.nvim](https://github.com/nvim-lua/telescope.nvim) - Find, filter, preview and pick using a nice UI

- [nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall) - Easy install LSP servers
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easy default configs for the builtin LSP client
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - Better UI for LSP outputs (docs, rename, errors)
- [nvim-compe](https://github.com/hrsh7th/nvim-compe) - One of the best autocomplete plugins for Neovim
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip), [vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ) - Snippet engine
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Preconfigured snippets for multiple languages

- [lua-dev.nvim](https://github.com/folke/lua-dev.nvim) - Lua development plugin

# Basic Usage

## Buffer
- :ls          returns information about each buffer
- :bn          switch to the next buffer
- :bp          switch to the previous buffer
- :b<number>   switch to buffer number <number>
- :badd <file> open file in a hidden buffer
- :e <file>    open file in a new buffer and do it current
- :bd <number> delete the buffer - also takes buffer numbers as arguments
- :ball        open all buffers into windows
- c-6          switch to alternate buffer

- gg	go to begin of filed
- vG    select to end of file
- gv    select last select block
- >>    ident right
- <<	ident left
- =		auto ident
- vi}   select inner object until }
- =i}   auto ident inner object until }
