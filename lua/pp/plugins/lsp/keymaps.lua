local M = {}

function M.on_attach(client, bufnr)
  local tb = require("telescope.builtin")
  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  nmap("gd", tb.lsp_definitions, "[G]oto [D]efinition")
  nmap("gI", tb.lsp_implementations, "[G]oto [I]mplementation")
  nmap("gr", tb.lsp_references, "[G]oto [R]eferences")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  -- Jump to the type of the word under your cursor.
  --  Useful when you're not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  nmap("<leader>D", tb.lsp_type_definitions, "Type [D]efinition")

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  nmap("<leader>ds", tb.lsp_document_symbols, "[D]ocument [S]ymbols")

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  nmap("<leader>ws", tb.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- rename
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

  -- code action
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]tion")

  -- signature
  nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- The following autocommand is used to enable inlay hints in your
  -- code, if the language server you are using supports them
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    nmap("<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, "[T]oggle Inlay [H]ints")
  end
end

return M
