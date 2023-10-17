require "trouble".setup {
  use_diagnostic_signs = true,
  padding = false,
  action_keys = {
    close = "q"
  }
}

lvim.builtin.dap.active = false
lvim.builtin.which_key.mappings.d = {
  name = "Diagnostics",
  -- t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "Current Word References" },
}
