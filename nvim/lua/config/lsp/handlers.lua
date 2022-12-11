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
      virtual_text = { spacing = 10, prefix = "● ", source = true },
      -- virtual_text = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "double",
        severity_sort = true,
        source = true
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

  -- Toggle Diagnostic VirtualText
  require 'toggle_lsp_diagnostics'.init({
    underline = false,
    virtual_text = { spacing = 10, prefix = "● ", source = true },
    update_in_insert = false
  })
  local whichkey = require "which-key"
  local keymap_l = {
    l = {
      name = "Lsp",
      v = { "<Plug>(toggle-lsp-diag-vtext)<CR>", "Toggle VirtualText" },
      d = {
        name = "Diagnostics",
        u = { "<Plug>(toggle-lsp-diag-underline)", "Toggle Diagnostic Underline" }
      }
    }
  }
  whichkey.register(keymap_l, { prefix = "<leader>" })

end

return M
