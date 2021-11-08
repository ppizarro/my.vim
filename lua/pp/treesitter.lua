local ts_configs = require("nvim-treesitter.configs")

ts_configs.setup({
  highlight = { enable = true },
  ensure_installed = {
    "go",
    "lua",
    "rust",
    "yaml",
    "json",
    "bash",
  },
})
