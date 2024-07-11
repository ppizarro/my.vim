-- Add any servers here together with their settings
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
          --disable = { "missing-fields" },
        },
        completion = {
          callSnippet = "Replace",
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
