return {

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local nightfox = require("nightfox")
      local options = {
        modules = {
          cmp = true,
          diagnostic = true,
          gitsigns = true,
          lsp_trouble = true,
          native_lsp = true,
          neotest = true,
          neotree = true,
          telescope = true,
          treesitter = true,
        },
      }
      local groups = {
        all = {
          Whitespace = { link = "Comment" },
        },
      }
      nightfox.setup({ options = options, groups = groups })
      nightfox.load()
    end,
  },

  --[[
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({ style = "night" })
      tokyonight.load()
    end,
  },
--]]
}
