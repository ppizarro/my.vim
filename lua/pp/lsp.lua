-- documentation:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer

local servers = require("nvim-lsp-installer.servers")
local lsp_signature = require("lsp_signature")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local on_attach = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  lsp_signature.on_attach(client)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- gopls and rust-analyzer does not yet support goto declaration
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gS', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

  -- hover
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- signature
  buf_set_keymap('i', '<c-s>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- rename
  buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

  -- code action
  buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- jump diagnostic
  -- goto previous/next diagnostic warning/error
  buf_set_keymap('n', '[e', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
      vim.cmd [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]]
  end

  if filetype == "go" then
    vim.cmd [[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
  end
end

local function default_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
      }
  }
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

  return {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 50,
      },
  }
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

-- Configure go language server for neovim development
local go_settings = {
    gopls = {
        analyses = {
            unusedparams = true,
            nilness = true,
            --shadow = true,
            unusedwrite = true,
        },
        staticcheck = true,
        buildFlags = { "-tags=integration" },
    },
}

local function make_config(server)
  local config = default_config()

  if server == "gopls" then
    config.settings = go_settings
    config.flags = {
      debounce_text_changes = 200,
    }
  end

  if server == "sumneko_lua" then
    config.settings = lua_settings
    config.cmd = {vim.fn.expand("~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server")}
    local luacfg = require("lua-dev").setup({
      lspconfig = config
    })
    return luacfg
  end

  return config
end

local servers_to_install = {
  "gopls", -- golang
  "sumneko_lua", -- lua
  "bashls", -- bash
  "yamlls", -- yaml
  "jsonls", -- json
  "rust_analyzer", -- rust
  "tflint", -- terraform
  --"ansiblels", -- ansible
  "dockerls", -- docker
}

local function install_servers()
  for _, server in pairs(servers_to_install) do
    local server_available, requested_server = servers.get_server(server)
    requested_server:on_ready(function ()
      local opts = make_config(server)
      requested_server:setup(opts)
      vim.cmd([[do User LspAttachBuffers]])
    end)
    if server_available then
      if not requested_server:is_installed() then
        requested_server:install()
      end
    end
  end
end

install_servers()
