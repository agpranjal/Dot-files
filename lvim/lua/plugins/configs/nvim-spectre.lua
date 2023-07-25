require("spectre").setup()

lvim.builtin.which_key.mappings["ss"] = {
  name = "Search/Replace",
  w = {
    "<cmd>lua require('spectre').toggle()<cr>", "Search/Replace Workspace"
  },
  f = {
    "<cmd>lua require('spectre').open_file_search()<cr>", "Search/Replace Current File"
  }
}
