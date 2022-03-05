vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"

  -- visual
  use {
    "folke/tokyonight.nvim",
    config = function()
      require("pp.colors")
    end,
  }
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

  -- snippets
  use {"rafamadriz/friendly-snippets"}
  use{
    "L3MON4D3/LuaSnip",
    config = function()
      require("pp.luasnip")
    end
  }

  -- completion
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("pp.cmp")
    end,
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
    config = function()
      require("pp.lsp")
    end,
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
    config = function()
      require("pp.treesitter")
    end,
  })
  --use({ "nvim-treesitter/playground" })
  --]]

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

  -- comments
  use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
  })

  -- lua dev
  use {"folke/lua-dev.nvim"}
end)
