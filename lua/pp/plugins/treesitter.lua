return {
  {
    "nvim-treesitter/nvim-treesitter",
    --dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
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
        "rust",
        "vim",
        "vimdoc",
        "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require("nvim-treesitter.install").prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
