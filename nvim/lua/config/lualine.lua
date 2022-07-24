local M = {}

-- Color for highlights
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local function separator()
  return "%="
end

local config = {
  options = {
    icons_enabled = true,
    -- theme="auto",
    -- globalstatus = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { {
      'buffers',
      separator = "",
    } },
    lualine_x = {},
    lualine_y = { 'encoding', 'filetype' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
-- local function ins_right(component)
--   table.insert(config.sections.lualine_x, component)
-- end

function M.setup()
  ins_left {
    'lsp_progress',
    -- display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' } },
    -- With spinner
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
    colors = {
      percentage      = colors.cyan,
      title           = colors.cyan,
      message         = colors.cyan,
      spinner         = colors.cyan,
      lsp_client_name = colors.magenta,
      use             = true,
    },
    separators = {
      component = ' ',
      progress = ' | ',
      message = { pre = '(', post = ')' },
      percentage = { pre = '', post = '%% ' },
      title = { pre = '', post = ': ' },
      lsp_client_name = { pre = '[', post = ']' },
      spinner = { pre = '', post = '' },
      message = { commenced = 'In Progress', completed = 'Completed' },
    },
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
    timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = -1 },
    spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
  }

  require "lualine".setup(config)
end

return M
