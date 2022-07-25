local M = {}

function M.setup()
  require "bufdel".setup {
    next = 'alternate',
    quit = true,
  }

  vim.cmd [[
  cnoreabbrev q BufDel
  cnoreabbrev q! BufDel!
  cnoreabbrev qq quit
  cnoreabbrev qq! quit!
  ]]
end

return M
