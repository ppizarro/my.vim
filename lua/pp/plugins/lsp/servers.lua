-- Add any servers here together with their settings
local servers = {
  lua_ls = {},
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
  terraformls = {},
  bashls = {},
  jsonls = {},
  html = {},
  -- htmx = {},
  tailwindcss = {},
  -- rust_analyzer = {
  --   settings = {
  --     ["rust-analyzer"] = {
  --       cargo = {
  --         allFeatures = true,
  --       },
  --       check = {
  --         command = "clippy",
  --       },
  --     },
  --   },
  -- },
  clangd = {
    settings = {
      clangd = {
        semanticHighlighting = true,
        --fallbackFlags = { "-std=c++17" },
      },
    },
  },
}

return servers
