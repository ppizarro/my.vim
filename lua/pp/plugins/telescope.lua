return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    local trouble = require("trouble.sources.telescope")
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
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
        mappings = {
          i = {
            ["<c-enter>"] = "to_fuzzy_refine",
            ["<c-t>"] = trouble.open,
          },
          n = { ["<c-t>"] = trouble.open },
        },
      },
    })
    -- extensions
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    local wk = require("which-key")
    wk.add({
      { "<leader>s", group = "[S]earch" }, -- group
      { "<leader>sh", builtin.help_tags, desc = "[S]earch [H]elp" },
      { "<leader>sk", builtin.keymaps, desc = "[S]earch [K]eymaps" },
      { "<leader>sf", builtin.find_files, desc = "[S]earch [F]iles" },
      { "<leader>ss", builtin.builtin, desc = "[S]earch [S]elect Telescope" },
      { "<leader>sw", builtin.grep_string, desc = "[S]earch current [W]ord" },
      { "<leader>sg", builtin.live_grep, desc = "[S]earch by [G]rep" },
      { "<leader>sd", builtin.diagnostics, desc = "[S]earch [D]iagnostics" },
      { "<leader>sr", builtin.resume, desc = "[S]earch [R]esume" },
      { "<leader>s.", builtin.oldfiles, desc = '[S]earch Recent Files ("." for repeat)' },
      {
        "<leader><leader>",
        function()
          builtin.buffers({ sort_lastused = true })
        end,
        desc = "[ ] Find existing buffers",
      },

      -- Slightly advanced example of overriding default behavior and theme
      {
        "<leader>/",
        function()
          -- You can pass additional configuration to Telescope to change the theme, layout, etc.
          builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
          }))
        end,
        desc = "[/] Fuzzily search in current buffer",
      },

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      {
        "<leader>s/",
        function()
          builtin.live_grep({
            grep_open_files = true,
            prompt_title = "Live Grep in Open Files",
          })
        end,
        desc = "[S]earch [/] in Open Files",
      },

      -- Shortcut for searching your Neovim configuration files
      {
        "<leader>sn",
        function()
          builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "[S]earch [N]eovim files",
      },
    })
  end,
}
