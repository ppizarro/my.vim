return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      hijack_netrw_behavior = "open_current",
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
