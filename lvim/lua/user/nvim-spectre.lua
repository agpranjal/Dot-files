require("spectre").setup()

lvim.builtin.which_key.mappings.s.s = {
  name = "Search/Replace",
  w = {
    "<cmd>lua require('spectre').toggle()<cr>", "Search/Replace Workspace (Spectre)"
  },
  f = {
    "<cmd>lua require('spectre').open_file_search()<cr>", "Search/Replace Current File (Spectre)"
  }
}
