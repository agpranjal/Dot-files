require('toggle_lsp_diagnostics').init({
  -- init() defaults *every* vim.diagnostic.config() key to true, so anything
  -- core adds gets switched on behind our back. Pin the ones we don't want:
  --
  -- avoids a crash on Neovim 0.11+: the plugin toggles every vim.diagnostic.config()
  -- key as a boolean, but 'jump' now expects a table (or nil)
  jump = false,
  -- Neovim 0.11+ key. Renders each diagnostic *again* on its own line below the
  -- code ("└─ reportMissingImports: ..."), duplicating the virtual text that is
  -- already at end of line.
  virtual_lines = false,
})

lvim.builtin.which_key.mappings.l.v = {
  "<cmd>silent! ToggleDiag<cr>",
  "Virtual Text (toggle)"
}
