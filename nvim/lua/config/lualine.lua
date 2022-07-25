local M = {}

-- Color table for highlights
local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

local function lsp_client()
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    return ""
  end
  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    -- if client.name ~= "null-ls" then
    --   table.insert(buf_client_names, client.name)
    -- end
    if not contains(buf_client_names, client.name) then
      table.insert(buf_client_names, client.name)
    end
  end
  return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

function M.setup()
  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        { "filename", component_separators = "" },
        { lsp_client, icon = "", color = { fg = colors.violet, gui = "bold" } },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

return M
