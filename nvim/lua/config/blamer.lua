local M = {}

function M.setup()
  vim.cmd [[
    let g:blamer_enabled = 1
    let g:blamer_delay = 50
    let g:blamer_relative_time = 1
    let g:blamer_template = "                       <committer> • <committer-time> • <summary>"
  ]]
end

return M
