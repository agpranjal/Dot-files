require('toggle_lsp_diagnostics').init({
  -- avoids a crash on Neovim 0.11+: the plugin toggles every vim.diagnostic.config()
  -- key as a boolean, but 'jump' now expects a table (or nil)
  jump = false,
})

lvim.builtin.which_key.mappings.l.v = {
  "<cmd>silent! ToggleDiag<cr>",
  "Virtual Text (toggle)"
}
