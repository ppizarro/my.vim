return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- visual
    use { "EdenEast/nightfox.nvim", run = ":NightfoxCompile" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "hoob3rt/lualine.nvim" }

    -- navigation
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        "nvim-telescope/telescope.nvim", branch = '0.1.x',
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

    -- highlight, edit, and navigate code
    use { "nvim-treesitter/nvim-treesitter" }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }

    -- lsp
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/nvim-lsp-installer",
        },
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
        },
    }

    -- snippets
    use { "rafamadriz/friendly-snippets" }
    use {
        "L3MON4D3/LuaSnip",
        requires = {
            "saadparwaiz1/cmp_luasnip",
        },
    }

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    -- comments
    use { "numToStr/Comment.nvim" }

    -- lua dev
    use { "folke/lua-dev.nvim" }
end)
