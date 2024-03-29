local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all"
    ensure_installed = "all",

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "phpdoc" },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },

    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil
    }
  }
end

return M
