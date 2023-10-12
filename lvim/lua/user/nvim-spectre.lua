require("spectre").setup({
  is_close = true
})

function _custom_spectre_toggle_workspace()
  vim.cmd [[
    NeoTreeClose
    lua require('spectre').toggle()
  ]]
end

function _custom_spectre_open_file()
  vim.cmd [[
    NeoTreeClose
    lua require('spectre').open_file_search({select_word=false})
  ]]
end

lvim.builtin.which_key.mappings.s.s = {
  name = "Search/Replace",
  w = { _custom_spectre_toggle_workspace, "Search/Replace Workspace (Spectre)" },
  f = { _custom_spectre_open_file, "Search/Replace Current File (Spectre)" }
}
