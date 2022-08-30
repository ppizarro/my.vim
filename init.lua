-- Leader key -> ","
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

if require('pp.bootstrap')() then
    require("pp.plugins")
    require('packer').sync()
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

require("pp.plugins")
require('pp.settings')
require('pp.keymaps')
require('pp.colors')
require('pp.lualine')
require('pp.telescope')
require('pp.nvim-tree')
require('pp.cmp')
require('pp.luasnip')
require('pp.lsp')
require('pp.treesitter')
require('gitsigns').setup()
require('Comment').setup()
