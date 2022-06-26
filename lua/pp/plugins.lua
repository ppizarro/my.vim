vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- visual
  use {
    "folke/tokyonight.nvim",
  }
  use {"kyazdani42/nvim-web-devicons"}
  use {
    "hoob3rt/lualine.nvim",
  }

  -- navigation
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
    },
  }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
        "kyazdani42/nvim-web-devicons",
    }
  }

  -- snippets
  use {"rafamadriz/friendly-snippets"}
  use{
    "L3MON4D3/LuaSnip",
  }

  -- completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip"
    },
  }

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      --"glepnir/lspsaga.nvim",
      "ray-x/lsp_signature.nvim",
    },
  }

  -- treesitter
  --[[
  use({
    "nvim-treesitter/nvim-treesitter",
  })
  --use({ "nvim-treesitter/playground" })
  --]]

  -- git
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
  }

  -- comments
  use({
      "numToStr/Comment.nvim",
  })

  -- lua dev
  use {"folke/lua-dev.nvim"}
end)
