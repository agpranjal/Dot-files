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
end

return M
