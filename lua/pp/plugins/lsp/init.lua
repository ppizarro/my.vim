-- documentation:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer

local on_attach = function(client, bufnr)
  require("pp.plugins.lsp.format").on_attach(client, bufnr)
  require("pp.plugins.lsp.keymaps").on_attach(client, bufnr)
  --[[
    -- highlight code references
    if client.supports_method("textDocument/documentHighlight") then
        local lsp_highlight = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
            group = lsp_highlight,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            group = lsp_highlight,
            callback = vim.lsp.buf.clear_references,
        })
    end
--]]
end

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    dependencies = {
      { "folke/neodev.nvim", config = true },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim", config = { automatic_installation = true } },
      { "nvim-telescope/telescope.nvim" },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      local tools = {
        "stylua",
        "golangci-lint",
        "gomodifytags",
        "shfmt",
        "shellcheck",
      }
      local mr = require("mason-registry")
      for _, t in ipairs(tools) do
        local p = mr.get_package(t)
        if not p:is_installed() then
          p:install()
        end
      end

      local servers = require("pp.plugins.lsp.servers")
      local mlc = require("mason-lspconfig")
      mlc.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      mlc.setup_handlers({
        function(server)
          local opts = servers[server] or {}
          opts.capabilities = capabilities
          opts.on_attach = on_attach
          require("lspconfig")[server].setup(opts)
        end,
      })
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "BufReadPre",
    config = function()
      local nls = require("null-ls")
      local formatting = nls.builtins.formatting
      local diagnostics = nls.builtins.diagnostics
      local actions = nls.builtins.code_actions

      nls.setup({
        sources = {
          formatting.shfmt,
          formatting.stylua,
          formatting.terraform_fmt,
          formatting.yamlfmt,
          diagnostics.golangci_lint,
          diagnostics.jsonlint,
          diagnostics.yamllint,
          diagnostics.shellcheck,
          actions.gomodifytags,
          actions.shellcheck,
          actions.gitsigns,
        },
        --on_attach = on_attach,
      })
    end,
  },
}
