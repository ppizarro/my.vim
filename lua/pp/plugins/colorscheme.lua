return {

  -- nightfox
  --[[
  {
    "EdenEast/nightfox.nvim",
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
          --neotest = true,
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
      vim.cmd.colorscheme("nightfox")
    end,
  },
  --]]

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        style = "moon",
        light_style = "day",
        transparent = false,
        terminal_colors = true,
      })
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme("tokyonight-moon")
    end,
  },
}
