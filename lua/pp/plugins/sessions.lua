return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      session_lens = {
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })
    vim.keymap.set(
      "n",
      "<Leader>ls",
      require("auto-session.session-lens").search_session,
      { desc = "[L]ist [S]essions", noremap = true }
    )
  end,
}
