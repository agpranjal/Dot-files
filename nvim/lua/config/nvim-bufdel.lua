-- nvim-bufdel
-- By Olivier Roques
-- github.com/ojroques

-- Options
local options = {
  next = 'alternate', -- how to retrieve the next buffer
  quit = true, -- exit when last buffer is deleted
}

-- Switch to buffer 'buf' on each window from list 'windows'
local function switch_buffer(windows, buf)
  local cur_win = vim.fn.winnr()
  for _, winid in ipairs(windows) do

    vim.cmd(string.format('%d wincmd w', vim.fn.win_id2win(winid)))
    vim.cmd(string.format('buffer %d', buf))
  end
  vim.cmd(string.format('%d wincmd w', cur_win)) -- return to original window
end

-- Select the first buffer with a number greater than given buffer
local function get_next_buf(buf)
  local alternate = vim.fn.bufnr('#')
  if options.next == 'alternate' and vim.fn.buflisted(alternate) == 1 then
    return alternate
  end
  local buffers, buf_index = {}, 1
  for i, bufinfo in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    if buf == bufinfo.bufnr then
      buf_index = i
    end
    table.insert(buffers, bufinfo.bufnr)
  end
  if options.next == 'tabs' and buf_index == #buffers and #buffers > 1 then
    return buffers[#buffers - 1]
  end
  return buffers[buf_index % #buffers + 1]
end

-- Retrieve the buffer associated to the given name or number
local function get_buf(bufexpr)
  if not bufexpr then -- return current buffer when 'bufexpr' is nil
    return vim.fn.bufnr()
  end
  if tonumber(bufexpr) then
    return tonumber(bufexpr)
  end
  bufexpr = string.gsub(bufexpr, [[^['"]+]], '') -- escape any start quote
  bufexpr = string.gsub(bufexpr, [[['"]+$]], '') -- escape any end quote
  return vim.fn.bufnr(bufexpr)
end

-- Delete given buffer, ignoring changes if 'force' is set
local function delete_buffer(bufexpr, force)
  if #vim.fn.getbufinfo({ buflisted = 1 }) < 2 then
    if options.quit then
      -- exit when there is only one buffer left
      if force then
        vim.cmd('qall!')
      else
        if not pcall(vim.cmd, "silent qall") then
          vim.notify("Buffer has unwritten changes. Please save them first.")
        end
      end
      return
    end
    -- don't exit and create a new empty buffer
    vim.cmd('enew')
    vim.cmd('bp')
  end
  local buf = get_buf(bufexpr)
  if vim.fn.buflisted(buf) == 0 then -- exit if buffer number is invalid
    return
  end
  -- retrieve buffer and delete it while preserving window layout
  local next_buf = get_next_buf(buf)
  local windows = vim.fn.getbufinfo(buf)[1].windows
  switch_buffer(windows, next_buf)
  -- force deletion of terminal buffers
  if force or vim.fn.getbufvar(buf, '&buftype') == 'terminal' then
    vim.cmd(string.format('bd! %d', buf))
  else
    -- vim.cmd(string.format('silent! bd %d', buf))
    if not pcall(vim.cmd, string.format('silent bd %d', buf)) then
      vim.notify("Buffer has unwritten changes. Please save them first.")
    end
  end
  -- revert buffer switches if deletion was cancelled
  if vim.fn.buflisted(buf) == 1 then
    switch_buffer(windows, buf)
  end
end

vim.cmd [[
  if exists('g:loaded_bufdel')
    finish
  endif

  command! -nargs=? -bang -complete=buffer BufDel
  \ lua require('config.nvim-bufdel').delete_buffer(<q-args>, '<bang>' == '!')

  let g:loaded_bufdel = 1
]]


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

local function close_buffer_or_window(force)
  vim.cmd [[
    let total_windows = len(filter(nvim_list_wins(), {k,v->nvim_win_get_config(v).relative==""}))
  ]]

  local total_windows = vim.api.nvim_eval("g:total_windows") -- Total no. of non-floating windows
  local is_tree_open = vim.fn.bufname("^neo-tree") ~= ""

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

vim.cmd [[
  set iskeyword+=!
  cnoreabbrev <silent> q lua require "config.nvim-bufdel".close_buffer_or_window(false)
  cnoreabbrev <silent> q! lua require "config.nvim-bufdel".close_buffer_or_window(true)
]]

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

return {
  delete_buffer = delete_buffer,
  close_buffer_or_window = close_buffer_or_window
}
