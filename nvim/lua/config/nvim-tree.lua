local M = {}

local whichkey = require "which-key"

function M.setup()
  require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    auto_reload_on_write = true,
    open_on_setup = true,
    open_on_setup_file = true,
    hijack_cursor = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    actions = {
      open_file = {
        window_picker = {
          enable = false
        }
      }
    },
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "s", action = "vsplit" },
          { key = "h", action = "split" }
        }
      }
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true,
        inline_arrows = false
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true
    }
  })

  -- Whichkey mappings for NvimTree
  local keymap_space = {
    ["<leader>"] = { "<cmd>lua require('nvim-tree').toggle(false, true)<cr>", "Explorer" },
  }
  whichkey.register(keymap_space, { prefix = "<leader>" })

  -- Close nvim if NvimTree is the last open window
  vim.cmd "autocmd BufEnter * if (winnr('$') == 1 && &filetype == 'NvimTree') | quit | endif"
end

return M
