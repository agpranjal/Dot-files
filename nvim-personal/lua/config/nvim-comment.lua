local M = {}

local whichkey = require "which-key"

function M.setup()
  require 'nvim-treesitter.configs'.setup {
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    }
  }

  require "nvim_comment".setup {
    create_mappings = true,
    line_mapping = nil,
    operator_mapping = " /",
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  }

  -- Normal mode
  local keymap_n = {
    ["/"] = { "<cmd>CommentToggle<cr>", "Comment (toggle)" }
  }
  whichkey.register(keymap_n, { mode = "n", prefix = "<leader>" })

  -- Visual mode
  local keymap_v = {
    ["/"] = { "Comment (toggle)" }
  }
  whichkey.register(keymap_v, { mode = "v", prefix = "<leader>" })

  -- Required bcos comment don't seem to be working for terraform files
  vim.cmd [[
    augroup CommentStringExceptions
      autocmd!
      autocmd FileType terraform lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
    augroup end
  ]]
end

return M
