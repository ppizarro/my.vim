local nt = require("neotest")

nt.setup({
    adapters = {
        require("neotest-go")({
            experimental = {
                test_table = true,
            },
            args = { "-count=1", "-timeout=60s" }
        }),
    },
    diagnostic = {
        enabled = true
    },
    running = {
        concurrent = false,
    },
    status = {
        enabled = true,
        virtual_text = false,
        signs = true,
    },
    strategies = {
        integrated = {
            width = 180,
        },
    },
})

vim.keymap.set('n', '<leader>tt', nt.run.run)
vim.keymap.set('n', '<leader>tf', function() nt.run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>tp', function() nt.run.run(vim.fn.getcwd()) end)
vim.keymap.set('n', '<leader>ts', nt.summary.toggle)
vim.keymap.set("n", "[t", function() nt.jump.prev { status = "failed" } end)
vim.keymap.set("n", "]t", function() nt.jump.next { status = "failed" } end)
