local M = {}

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
          { key = "s", action = "split" },
          { key = "v", action = "vsplit" }
        }
      }
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true
      },
    },
    -- update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true
    }
  })
end

return M
