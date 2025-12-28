lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree

-- Ensure nvim-web-devicons is loaded before neo-tree
-- This is critical for icons to display properly in neo-tree
local ok, devicons = pcall(require, "nvim-web-devicons")
if ok then
  devicons.setup({
    default = true,
    strict = true,
    color_icons = true,
  })
else
  vim.notify("nvim-web-devicons not found! Icons may not display properly.", vim.log.levels.WARN)
end

require "neo-tree".setup {
  close_if_last_window = true,
  open_files_do_not_replace_types = { "terminal", "trouble", "qf", "spectre" },
  default_component_configs = {
    indent = {
      indent_size = 3,
    },
    -- Icons are automatically handled by nvim-web-devicons
    -- No need to override unless you want custom icons
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName"
    },
    git_status = {
      symbols = {
        -- Using simpler Unicode characters that work with most fonts
        added     = "✚",
        modified  = "●",
        deleted   = "✖",
        renamed   = "➜",
        untracked = "?",
        ignored   = "◌",
        unstaged  = "○",
        staged    = "●",
        conflict  = "⚠",
      }
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
    use_libuv_file_watcher = true,
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
