return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local filetypes = {
        "bash",
        "gitignore",
        "go",
        "gomod",
        "c",
        "diff",
        "html",
        "css",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "query",
        "rust",
        "vim",
        "vimdoc",
        "yaml",
      }
      require("nvim-treesitter").install(filetypes)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
