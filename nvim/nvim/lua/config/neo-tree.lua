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
    window = {
      mappings = {
        ["<space>"] = "none"
      }
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      follow_current_file = true,
      use_libuv_file_watcher = true
    },
    buffers = {
      follow_current_file = true,
      group_empty_dirs = true
    }
  }

  -- Automatically open NeoTree on startup
  vim.cmd [[
    augroup NeoTreeOpenOnStartup
      autocmd!
      autocmd VimEnter * silent! Neotree reveal_force_cwd show
    augroup end
  ]]

  local keymap = {
    e = { "<cmd>Neotree reveal_force_cwd show toggle<cr>", "Explorer (toggle)" }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
