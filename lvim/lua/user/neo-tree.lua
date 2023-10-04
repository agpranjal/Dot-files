lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree

require "neo-tree".setup {
  close_if_last_window = true,
  open_files_do_not_replace_types = { "terminal", "trouble", "qf", "spectre" },
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

function _custom_neotree_toggle()
  vim.cmd [[
    UndotreeHide
    Neotree reveal_force_cwd show toggle
  ]]
end

lvim.builtin.which_key.mappings["e"] = {
  _custom_neotree_toggle,
  "Explorer"
}

-- Automatically open NeoTree on startup
vim.cmd [[
    augroup NeoTreeOpenOnStartup
      autocmd!
      autocmd VimEnter * silent! Neotree reveal_force_cwd show
    augroup end
]]
