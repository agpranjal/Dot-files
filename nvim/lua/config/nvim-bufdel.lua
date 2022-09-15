local M = {}

function _G.close_buffer_or_window(force)
  vim.cmd [[
    let total_windows = len(filter(nvim_list_wins(), {k,v->nvim_win_get_config(v).relative==""}))
  ]]

  local total_windows = vim.api.nvim_eval("g:total_windows") -- Total no. of non-floating windows
  local is_tree_open = require "nvim-tree.view".is_visible() -- If NvimTree is open

  -- Do not include NvimTree window
  if is_tree_open then
    total_windows = total_windows - 1
  end

  if total_windows <= 1 then -- No splits open
    if force then
      vim.cmd "BufDel!"
    else
      vim.cmd "BufDel"
    end
  else -- Splits open
    if force then
      vim.cmd "bd!"
    else
      vim.cmd "bd"
    end
  end
end

function M.setup()
  require "bufdel".setup {
    next = 'alternate',
    quit = true,
  }

  -- vim.cmd [[
  -- set iskeyword+=!
  -- cnoreabbrev <silent> q BufDel
  -- cnoreabbrev <silent> q! BufDel!
  -- cnoreabbrev qq quit
  -- cnoreabbrev qq! quit!
  -- ]]

  vim.cmd [[
    set iskeyword+=!
    cnoreabbrev <silent> q lua _G.close_buffer_or_window(false)
    cnoreabbrev <silent> q! lua _G.close_buffer_or_window(true)
  ]]
end

return M
