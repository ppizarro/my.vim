local M = {}

function M.on_attach(client, bufnr)
  local tb = require("telescope.builtin")
  local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

  -- Find references for the word under your cursor.
  map("grr", tb.lsp_references, "[G]oto [R]eferences")

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  map("gri", tb.lsp_implementations, "[G]oto [I]mplementation")

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  map("grd", tb.lsp_definitions, "[G]oto [D]efinition")

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  map("gO", tb.lsp_document_symbols, "Open Document Symbols")

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  map("gW", tb.lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

  -- Jump to the type of the word under your cursor.
  --  Useful when you're not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  map("grt", tb.lsp_type_definitions, "[G]oto [T]ype Definition")

  -- signature
  map("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  -- The following code creates a keymap to toggle inlay hints in your
  -- code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  --
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, bufnr) then
    map("<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, "[T]oggle Inlay [H]ints")
  end
end

return M
