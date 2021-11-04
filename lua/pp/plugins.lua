vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- visual
  use {"folke/tokyonight.nvim"}
  -- use {"arcticicestudio/nord-vim", disable = true }
  -- use {"fenetikm/falcon", disable = true }
  -- use {"nanotech/jellybeans.vim", tag = "v1.7", disable = true }
  -- use {"fatih/molokai", disable = true }
  use {"kyazdani42/nvim-web-devicons"}
  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require("pp.lualine")
    end,
  }

  -- navigation
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("pp.telescope")
    end,
    requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",

    },
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("pp.nvim-tree")
    end,
    requires = {
        "kyazdani42/nvim-web-devicons",
    }
  }

  -- lsp, linting and snippets
  use {"rafamadriz/friendly-snippets"}
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require("pp.lspsaga")
    end,
  }
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("pp.lsp")
    end,
    requires = {
      "ray-x/lsp_signature.nvim",
      "kabouzeid/nvim-lspinstall",
    },
  }

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require("pp.completion")
    end,
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "onsails/lspkind-nvim",
    },
  }

  -- git
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    requires = {
        "nvim-lua/plenary.nvim",
    },
  }

  -- lua dev
  use {"folke/lua-dev.nvim"}
end)
