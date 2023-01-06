return {

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local nightfox = require("nightfox")
      nightfox.setup()
      nightfox.load()
    end,
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    config = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({ style = "moon" })
      tokyonight.load()
    end,
  },
}
