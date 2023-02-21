-- Add any servers here together with their settings
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
        completion = {
          callSnippet = "Replace",
        },
        format = {
          enable = false,
        },
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
        buildFlags = { "-tags=integration,unit" },
        usePlaceholders = true,
      },
    },
  },
  terraformls = {},
  bashls = {},
  jsonls = {},
  yamlls = {},
  dockerls = {},
}

return servers
