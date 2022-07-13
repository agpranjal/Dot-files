local M = {}

function M.setup()
  -- LSP handlers configuration
  local lsp = {
    float = {
      focusable = true,
      style = "minimal",
      border = "solid",
    },
    diagnostic = {
      -- virtual_text = true,
      virtual_text = { spacing = 10, prefix = "● " },
      underline = true,
      source = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "double",
      },
    },
  }

  -- Diagnostic signs
  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  -- Diagnostic configuration
  vim.diagnostic.config(lsp.diagnostic)

  -- Hover configuration
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)

  -- Signature help configuration
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)

end

return M
