-- documentation:
-- https://github.com/hrsh7th/nvim-cmp

return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    config = function()
      local ls = require("luasnip")

      ls.config.set_config({
        -- This tells LuaSnip to remember to keep around the last snippet.
        -- You can jump back into it even if you move outside of the selection
        history = true,

        -- This one is cool cause if you have dynamic snippets, it updates as you type!
        updateevents = "TextChanged,TextChangedI",

        -- Autosnippets:
        enable_autosnippets = true,
      })

      -- <c-k> is my expansion key
      -- this will expand the current item or jump to the next item within the snippet.
      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      -- <c-j> is my jump backwards key.
      -- this always moves to the previous item within the snippet
      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      -- <c-l> is selecting within a list of options.
      -- This is useful for choice nodes (introduced in the forthcoming episode 2)
      vim.keymap.set("i", "<c-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local lspkind = require("lspkind")
      lspkind.init()

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "path" },
          { name = "buffer" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        formatting = {
          format = lspkind.cmp_format(),
        },
        view = {
          --entries = 'native'
          entries = { name = "custom", selection_order = "near_cursor" },
        },
      })

      -- Use buffer source for `/`
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
