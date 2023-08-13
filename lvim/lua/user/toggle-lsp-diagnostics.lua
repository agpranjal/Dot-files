require('toggle_lsp_diagnostics').init()

lvim.builtin.which_key.mappings.l.v = {
  "<cmd>silent! ToggleDiag<cr>",
  "Virtual Text (toggle)"
}
