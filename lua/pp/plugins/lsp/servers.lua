-- Add any servers here together with their settings
local servers = {
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
  ['terraform-ls'] = {},
  ['bash-language-server'] = {},
  ['json-lsp'] = {},
  -- ['html-lsp'] = {},
  -- ['htmx-lsp'] = {},
  -- ['tailwindcss-language-server'] = {},
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
