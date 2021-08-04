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
      require("config.lualine")
    end,
  }

  -- navigation
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
    },
  }

  -- lsp, completion, linting and snippets
  use {"rafamadriz/friendly-snippets"}
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
    requires = {
      "ray-x/lsp_signature.nvim",
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
      --"kabouzeid/nvim-lspinstall",
    },
  }

  use {
    "hrsh7th/nvim-compe",
    config = function()
      require("config.compe")
    end,
    event = "InsertEnter *",
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
end)
