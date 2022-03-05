-- documentation:
-- https://github.com/hrsh7th/nvim-cmp

vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

local lspkind = require('lspkind')
lspkind.init()

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },

  sources = {
    { name = "nvim_lua" },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    --['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = lspkind.cmp_format(),
  },

  experimental = {
    native_menu = false,
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', keyword_length = 5 }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
