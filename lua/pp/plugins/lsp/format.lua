local M = {}

local formatBuffer = function(bufnr)
  local ft = vim.bo[bufnr].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      end
      return client.name ~= "null-ls"
    end,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.format()
  local bufnr = vim.api.nvim_get_current_buf()
  formatBuffer(bufnr)
end

function M.on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = M.augroup,
      buffer = bufnr,
      callback = function()
        formatBuffer(bufnr)
      end,
    })
  end
end

return M
