local M = {}

function M.setup()
  require "bufdel".setup {
    next = 'alternate',
    quit = true,
  }

  vim.cmd [[
  set iskeyword+=!
  cnoreabbrev <silent> q BufDel
  cnoreabbrev <silent> q! BufDel!
  cnoreabbrev qq quit
  cnoreabbrev qq! quit!
  ]]
end

return M
