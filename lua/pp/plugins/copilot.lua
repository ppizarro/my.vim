return {
  "github/copilot.vim",
  event = "VeryLazy",
  cmd = "Copilot",
  config = function()
    vim.g.copilot_workspace_folders = { "~/code" }
    vim.g.copilot_filetypes = {
      "gitcommit",
    }
  end,
}
