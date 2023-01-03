return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- visual
    use { "EdenEast/nightfox.nvim" }
    --use { "folke/tokyonight.nvim" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "hoob3rt/lualine.nvim" }

    -- navigation
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
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
    use { "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "nvim-treesitter/playground" }

    -- lsp
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
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

    -- tests
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go"
        }
    }

    -- lua dev
    use { "folke/neodev.nvim" }
end)
