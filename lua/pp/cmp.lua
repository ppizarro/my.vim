-- documentation:
-- https://github.com/hrsh7th/nvim-cmp

local lspkind = require 'lspkind'
lspkind.init()

--
local cmp = require 'cmp'
local luasnip = require 'luasnip'

if cmp == nil then
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        --completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    },
    mapping = cmp.mapping.preset.insert(),
    formatting = {
        format = lspkind.cmp_format(),
    },
    view = {
        --entries = 'native'
        entries = { name = 'custom', selection_order = 'near_cursor' }
    }
}

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
