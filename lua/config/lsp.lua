-- Configure lsp
-- https://github.com/neovim/nvim-lspconfig#gopls
local nvim_lsp = require("lspconfig")

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.lsp.omnifunc")
  require "lsp_signature".on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
  }
}

-- enable gopls
nvim_lsp.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        nilness = true,
        shadow = true,
        unusedwrite = true,
      },
      staticcheck = true,
      buildFlags = { "-tags=integration" },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup {
  on_attach=on_attach,
  capabilities = capabilities,
}
