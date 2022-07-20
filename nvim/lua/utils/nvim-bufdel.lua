local M = {}

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
  local next = vim.fn.bufnr('#')
  if options.next == 'alternate' and vim.fn.buflisted(next) == 1 then
    return next
  end
  for i = 0, vim.fn.bufnr('$') - 1 do
    next = (buf + i) % vim.fn.bufnr('$') + 1 -- will loop back to 1
    if vim.fn.buflisted(next) == 1 then
      return next
    end
  end
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
function _G.delete_buffer_nvim_bufdel(bufexpr, force)
  if #vim.fn.getbufinfo({ buflisted = 1 }) < 2 then
    if options.quit then
      -- exit when there is only one buffer left
      if force then
        vim.cmd('qall!')
      else
        vim.cmd('qall')
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
  local next_buf = get_next_buf(buf)
  local windows = vim.fn.getbufinfo(buf)[1].windows
  switch_buffer(windows, next_buf)
  -- force deletion of terminal buffers to avoid the prompt
  if force or vim.fn.getbufvar(buf, '&buftype') == 'terminal' then
    vim.cmd(string.format('bd! %d', buf))
  else
    vim.cmd(string.format('silent! confirm bd %d', buf))
  end
  -- revert buffer switches if user has canceled deletion
  if vim.fn.buflisted(buf) == 1 then
    switch_buffer(windows, buf)
  end
end

function M.setup()
  vim.cmd "command! -nargs=? -bang -complete=buffer BufDel lua delete_buffer_nvim_bufdel(<q-args>, '<bang>' == '!')"

  vim.cmd([[

    set iskeyword+=!
    cnoreabbrev <silent> q BufDel
    cnoreabbrev <silent> q! BufDel!
    cnoreabbrev <silent> qq quit
    cnoreabbrev <silent> qq! quit!
    ]])
end

return M
