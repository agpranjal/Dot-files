require('multicursors').setup {
  hint_config = false,
}

local function is_active()
  local ok, hydra = pcall(require, 'hydra.statusline')
  return ok and hydra.is_active()
end

local function get_name()
  local ok, hydra = pcall(require, 'hydra.statusline')
  if ok then
    return hydra.get_name()
  end
  return ''
end

lvim.builtin.lualine.sections.lualine_b = {
  {
    "b:gitsigns_head",
    color = { gui = "bold" },
    icon = ""
  },
  { get_name, cond = is_active },
}

lvim.builtin.which_key.mappings.m = {
  name = "Multicursor",
  w = { "<cmd>MCstart<cr>", "Current word multicursor" },
  p = { "<cmd>MCpattern<cr>", "Pattern multicursor" },
  c = { "<cmd>MCclear<cr>", "Clear multicursors" },
}

lvim.builtin.which_key.vmappings.m = {
  name = "Multicursor",
  v = { "<cmd>MCvisual<cr>", "Visual selection multicursor" },
  p = { "<cmd>MCvisualPattern<cr>", "Visual pattern multicursor" },
}
