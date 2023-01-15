local M = {}

function M.on_attach(_, bufnr)
  local tb = require("telescope.builtin")
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  --Enable completion triggered by <c-x><c-o>
  --vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- rename
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

  -- code action
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]tion")

  nmap("<c-]>", vim.lsp.buf.definition, "Goto Definition")
  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("gr", tb.lsp_references, "[G]oto [R]eferences")
  nmap("<leader>ds", tb.lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", tb.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- hover
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  -- signature
  nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  nmap("<leader>F", require("pp.plugins.lsp.format").format, "[F]ormat")
end

return M
