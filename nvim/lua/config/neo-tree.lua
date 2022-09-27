local M = {}

local whichkey = require "which-key"

function M.setup()
  require "neo-tree".setup {
    close_if_last_window = true,
    default_component_configs = {
      indent = {
        indent_size = 3,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      follow_current_file = true,
      use_libuv_file_watcher = true
    },
    buffers = {
      group_empty_dirs = true
    }
  }

  -- Automatically open NeoTree on startup
  vim.cmd [[
    augroup NeoTreeOpenOnStartup
      autocmd!
      autocmd VimEnter * silent! NeoTreeShow
    augroup end
  ]]

  local keymap = {
    e = { "<cmd>NeoTreeShow<cr>", "Explorer" }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
