-- Autoformat
vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

-- TODO:
-- event = { 'BufWritePre' },
-- cmd = { 'ConformInfo' },

---@module 'conform'
---@type conform.setupOpts
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return { timeout_ms = 500 }
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  -- You can also specify external formatters in here.
  formatters_by_ft = {
    rust = { 'rustfmt' },
    sh = { 'shfmt' }, -- Used to format bash script
    yml = { 'yamlfmt' }, -- Used to format yaml files
  },
}

vim.keymap.set('', '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
