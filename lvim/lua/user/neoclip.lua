require('neoclip').setup {
  enable_persistent_history = true,
  continuous_sync = true,
  content_spec_column = true
}

lvim.builtin.which_key.mappings.s.c = {
  "<cmd>Telescope neoclip<cr>", "Clipboard"
}
lvim.builtin.which_key.mappings.s.C = {
  "<cmd>Telescope colorscheme<cr>", "Colorscheme"
}
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "neoclip")
end
