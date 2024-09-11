local M = {}

function M.on_attach(client, bufnr)
  local tb = require("telescope.builtin")
  local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  map("gd", tb.lsp_definitions, "[G]oto [D]efinition")
  map("gI", tb.lsp_implementations, "[G]oto [I]mplementation")
  map("gr", tb.lsp_references, "[G]oto [R]eferences")
  map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  -- Jump to the type of the word under your cursor.
  --  Useful when you're not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  map("<leader>D", tb.lsp_type_definitions, "Type [D]efinition")

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  map("<leader>ds", tb.lsp_document_symbols, "[D]ocument [S]ymbols")

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  map("<leader>ws", tb.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- rename
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

  -- code action
  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

  -- signature
  map("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- The following code creates a keymap to toggle inlay hints in your
  -- code, if the language server you are using supports them
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map("<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, "[T]oggle Inlay [H]ints")
  end
end

return M
