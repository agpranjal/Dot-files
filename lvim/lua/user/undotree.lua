function _custom_undotree_toggle()
  vim.cmd [[
  Neotree close
  UndotreeToggle
  ]]
end

lvim.builtin.which_key.mappings.u = {
  _custom_undotree_toggle,
  "Undotree (Toggle)"
}
