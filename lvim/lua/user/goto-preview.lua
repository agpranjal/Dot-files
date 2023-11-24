require('goto-preview').setup {
  width = 120,             -- Width of the floating window
  height = 25,             -- Height of the floating window
  default_mappings = true, -- Bind default mappings
  debug = false,           -- Print debug information
  opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
  post_open_hook = nil     -- A function taking two arguments, a buffer and a window to be ran as a hook.
}

vim.keymap.set(
  "n", "gpp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { noremap = true, desc = "Preview Definition" }
)

vim.keymap.set(
  "n", "gpc", "<cmd>lua require('goto-preview').close_all_win()<CR>",
  { noremap = true, desc = "Close Preview" }
)

vim.keymap.set(
  "n", "gpq", "<cmd>lua require('goto-preview').close_all_win()<CR>",
  { noremap = true, desc = "Close/Quit Preview" }
)
