-- documentation:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer

local on_attach = function(client, bufnr)
  require("pp.plugins.lsp.format").on_attach(client, bufnr)
  require("pp.plugins.lsp.keymaps").on_attach(client, bufnr)

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
end

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    version = false,
    event = "BufReadPre",
    dependencies = {
      {
        "folke/neodev.nvim",
        config = function()
          require("neodev").setup({
            library = { plugins = { "neotest", "plenary.nvim" }, types = true, setup_jsonls = false },
          })
        end,
      },
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        opts = {
          ensure_installed = {
            "jsonlint",
            "golangci-lint",
            --"gomodifytags",
            --"gofmt",
            "shfmt",
            "shellcheck",
            "stylua",
            "yamllint",
          },
        },
        config = function(_, opts)
          require("mason").setup(opts)
          local mr = require("mason-registry")
          for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
              p:install()
            end
          end
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "nvim-telescope/telescope.nvim" },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buffer = args.buf
          on_attach(client, buffer)
        end,
      })

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
          require("lspconfig")[server].setup(opts)
        end,
      })
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
      "nvim-lua/plenary.nvim",
    },
    event = "BufReadPre",
    ops = function()
      local nls = require("null-ls")
      local formatting = nls.builtins.formatting
      local diagnostics = nls.builtins.diagnostics
      local actions = nls.builtins.code_actions

      return {
        sources = {
          formatting.shfmt,
          formatting.stylua,
          --formatting.gofmt,
          diagnostics.golangci_lint,
          diagnostics.jsonlint,
          diagnostics.yamllint.with({
            extra_args = { "-d", "{extends: relaxed, rules: {line-length: {max: 200}}}" },
          }),
          diagnostics.shellcheck,
          --actions.gomodifytags,
          actions.shellcheck,
          actions.gitsigns,
        },
      }
    end,
  },

  -- progress
  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    config = true,
  },
}
