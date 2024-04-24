-- Add any servers here together with their settings
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            "${3rd}/luv/library",
            unpack(vim.api.nvim_get_runtime_file("", true)),
          },
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
  html = {},
  htmx = {},
  tailwindcss = {},
}

return servers
