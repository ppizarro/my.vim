return {
  {
    "nvim-treesitter/nvim-treesitter",
    --dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    main = "nvim-treesitter.config", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
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
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
