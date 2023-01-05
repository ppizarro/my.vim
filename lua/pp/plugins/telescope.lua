return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep({ prompt_prefix = "🔍" })
      end,
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers({ sort_lastused = true })
      end,
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_commits()
      end,
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
      end,
    },
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_files()
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        dynamic_preview_title = true,
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
          --vertical = { height = 0.95 },
          horizontal = { width = 0.95 },
        },
        sorting_strategy = "ascending",
        prompt_prefix = " ",
        selection_caret = " ",
        winblend = 0,
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
