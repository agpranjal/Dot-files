local M = {}

function M.setup()
  require("notify").setup {
    -- stages = 'fade_in_slide_out',
    stages = "slide",
    fps = 60,
    background_colour = 'FloatShadow',
    timeout = 1000,
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
