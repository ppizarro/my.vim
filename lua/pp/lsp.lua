-- documentation:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local telescope = require('telescope.builtin')

--[[
local on_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end
--]]

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    --Enable completion triggered by <c-x><c-o>
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Mappings.
    --
    -- rename
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- code action
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]tion')

    nmap('<c-]>', vim.lsp.buf.definition, 'Goto Definition')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gr', telescope.lsp_references)
    nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- hover
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- signature
    nmap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting,
        { desc = 'Format current buffer with LSP' })

    --[=[
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
      vim.cmd [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]]
  end
--]=]
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
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    return {
        --on_init = on_init,
        on_attach = on_attach,
        capabilities = capabilities,
        --[[
      flags = {
        debounce_text_changes = 50,
      },
      --]]
    }
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Configure lua language server for neovim development
local lua_settings = {
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
        },
        workspace = { library = vim.api.nvim_get_runtime_file('', true) },
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
        buildFlags = { "-tags=integration,unit" },
        usePlaceholders = true,
    },
}

local function make_config(server)
    local config = default_config()

    if server == "gopls" then
        config.settings = go_settings
        --[[
    config.flags = {
      debounce_text_changes = 200,
    }
--]]
    end

    if server == "sumneko_lua" then
        config.settings = lua_settings
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
    "dockerls", -- docker
}

local function config_servers()
    for _, server in ipairs(servers_to_install) do
        local opts = make_config(server)
        lspconfig[server].setup(opts)
    end
end

require("nvim-lsp-installer").setup {
    ensure_installed = servers_to_install,
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

config_servers()
