-- LSP Plugins
-- documentation:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/mason-org/mason.nvim

-- Useful status updates for LSP.
vim.pack.add { 'https://github.com/j-hui/fidget.nvim' }
require('fidget').setup {}

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
  if client and client:supports_method('textDocument/inlayHint', bufnr) then
    map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }) end, '[T]oggle Inlay [H]ints')
  end
end

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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('pp-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buffer = event.buf
    keymaps_on_attach(client, buffer)
    highlights_on_attach(client, buffer)
  end,
})

-- Enable the following language servers
--  See `:help lsp-config` for information about keys and how to configure
---@type table<string, vim.lsp.Config>
local servers = {
  stylua = {}, -- Used to format Lua code

  -- Special Lua Config, as recommended by neovim help docs
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

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
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        format = { enable = false }, -- Disable formatting (formatting is done by stylua)
      },
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
  -- ['jsonls'] = {},
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

vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

-- Automatically install LSPs and related tools to stdpath for Neovim
require('mason').setup {}

-- Ensure the servers and tools above are installed
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
--    :Mason
--
-- You can press `g?` for help in this menu.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  -- 'lua-language-server', -- Lua LSP
  -- 'rust-analyzer', -- Rust LSP
  'golangci-lint', -- Go linter
  'markdownlint', -- Markdown linter
  'impl', -- generates Go method stubs for implementing an interface
  'shfmt', -- Used to format bash script
  'yamlfmt', -- Used to format yaml files
  'hadolint', -- Used to lint dockerfiles
  'tflint', -- Used to lint terraform files
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

vim.pack.add {
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range '^9' },
}
