-- LSP Plugins
-- documentation:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/mason-org/mason.nvim

-- Useful status updates for LSP.
vim.pack.add { 'https://github.com/j-hui/fidget.nvim' }
require('fidget').setup {}

vim.pack.add { 'https://github.com/mason-org/mason.nvim' }

---@module 'mason.settings'
---@type MasonSettings
---@diagnostic disable-next-line: missing-fields
require('mason').setup {}

-- Main LSP Configuration
vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  -- Automatically install LSPs and related tools to stdpath for Neovim
  -- Mason must be loaded before its dependents so we need to set it up here.
  -- Maps LSP server names between nvim-lspconfig and Mason package names.
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

--- Add any servers here together with their settings
---@type table<string, vim.lsp.Config>
local servers = {
  stylua = {}, -- Used to format Lua code
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        workspace = {
          checkThirdParty = false,
          -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
          --  See https://github.com/neovim/nvim-lspconfig/issues/3189
          library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
            '${3rd}/luv/library',
            '${3rd}/busted/library',
          }),
        },
      })
    end,
    settings = {
      Lua = {},
    },
  },
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          nilness = true,
          --shadow = true,
          unusedwrite = true,
        },
        staticcheck = true,
        buildFlags = { '-tags=integration,unit' },
        usePlaceholders = true,
      },
    },
  },
  ['terraformls'] = {},
  ['bashls'] = {},
  ['bash-language-server'] = {},
  ['jsonls'] = {},
  -- ['html'] = {},
  -- ['htmx'] = {},
  -- ['tailwindcss'] = {},
  clangd = {
    settings = {
      clangd = {
        semanticHighlighting = true,
        --fallbackFlags = { "-std=c++17" },
      },
    },
  },
}

local highlights_on_attach = function(client, bufnr)
  -- The following two autocommands are used to highlight references of the
  -- word under your cursor when your cursor rests there for a little while.
  --    See `:help CursorHold` for information about when this is executed
  --
  -- When you move your cursor, the highlights will be cleared (the second autocommand).

  if client and client:supports_method('textDocument/documentHighlight', bufnr) then
    local highlight_augroup = vim.api.nvim_create_augroup('pp-lsp-highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('pp-lsp-detach', { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'pp-lsp-highlight', buffer = event2.buf }
      end,
    })
  end
end

local keymaps_on_attach = function(client, bufnr)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- signature
  map('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- The following code creates a keymap to toggle inlay hints in your
  -- code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  --
  if client and client:supports_method('textDocument/inlayHint', bufnr) then
    map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }) end, '[T]oggle Inlay [H]ints')
  end
end

local on_attach = function(client, bufnr)
  keymaps_on_attach(client, bufnr)
  highlights_on_attach(client, bufnr)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('pp-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buffer = event.buf
    on_attach(client, buffer)
  end,
})

-- Ensure the servers and tools above are installed
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'lua-language-server', -- Lua LSP
  'rust-analyzer', -- Rust LSP
  'golangci-lint', -- Go linter
  'markdownlint', -- Markdown linter
  'impl', -- generates Go method stubs for implementing an interface
  'shfmt', -- Used to format bash script
  'yamlfmt', -- Used to format yaml files
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

-- The following loop will configure each server with the capabilities we defined above.
-- This will ensure that all servers have the same base configuration, but also
-- allow for server-specific overrides.
for server_name, server_config in pairs(servers) do
  vim.lsp.config(server_name, server_config)
  vim.lsp.enable(server_name)
end

vim.pack.add {
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range '^9' },
}
