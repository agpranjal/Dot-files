local M = {}

local whichkey = require "which-key"

function M.setup()
  require("notify").setup {
    -- stages = 'fade_in_slide_out',
    stages = "slide",
    fps = 30,
    background_colour = 'FloatShadow',
    timeout = 1000,
    max_height = 20
  }
  vim.notify = require("notify")

  -- Escape from nvim-notify using <esc>
  vim.cmd [[
    augroup NvimNotifyEscape
      autocmd!
      autocmd BufEnter * lua if (vim.bo.filetype == "notify") then vim.cmd "nnoremap <buffer> <silent> <esc> :q<cr>" end
    augroup end
  ]]

  require "telescope".load_extension "notify"
  local keymap_n = {
    n = {
      name = "Notifications",
      h = { "<cmd>Telescope notify<cr>", "Notification History" },
      d = { "<cmd>lua require 'notify'.dismiss()<cr>", "Dismiss All Notifications" }
    }
  }
  whichkey.register(keymap_n, { mode = "n", prefix = "<leader>" })

end

return M
