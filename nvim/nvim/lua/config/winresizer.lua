local M = {}

local whichkey = require "which-key"

function M.setup()
  vim.cmd [[
    let g:winresizer_keycode_left="\<Left>"
    let g:winresizer_keycode_right="\<Right>"
    let g:winresizer_keycode_up="\<Up>"
    let g:winresizer_keycode_down="\<Down>"
  ]]

  local keymap = {
    ["<leader>"] = { "<cmd>WinResizerStartResize<cr>", "Window Resize" }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
