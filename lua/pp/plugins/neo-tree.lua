return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>n",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "NeoTree",
    },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  config = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  },
}