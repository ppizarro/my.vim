return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = {
    options = {
      theme = "nightfox",
      globalstatus = true,
      disabled_filetypes = { statusline = { "lazy", "alpha" } },
      --icons_enabled = false,
      --component_separators = '|',
      --section_separators = '',
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1 }, { "diagnostics", sources = { "nvim_diagnostic" } } },
      --lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix" },
  },
}
