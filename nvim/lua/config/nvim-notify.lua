local M = {}

function M.setup()
  require("notify").setup {
    -- stages = 'fade_in_slide_out',
    stages = "slide",
    fps = 30,
    background_colour = 'FloatShadow',
    timeout = 1000,
    max_width = 100,
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
end

return M
