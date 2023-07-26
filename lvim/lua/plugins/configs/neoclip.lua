require('neoclip').setup {
  enable_persistent_history = true,
  continuous_sync = true,
  content_spec_column = true
}

lvim.builtin.which_key.mappings["sR"] = {
  "<cmd>Telescope neoclip<cr>", "Clipboard"
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "neoclip")
end
