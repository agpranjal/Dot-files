-- none-ls.nvim is pinned by LunarVim's lazy-lock.json to a Nov-2023 commit, so
-- any :Lazy sync/restore puts the pre-Neovim-0.12 code back. Two things in its
-- client.lua break on 0.12:
--
--   1. it reads vim.lsp._request_name_to_capability, which core removed (the
--      table now lives at vim.lsp.protocol._request_name_to_server_capability)
--      -> "attempt to index field '_request_name_to_capability' (a nil value)"
--   2. it installs client.supports_method as a plain fn(method), but 0.12 core
--      calls it as a method, client:supports_method(method, bufnr), so the
--      client object arrives where the method name is expected
--
-- Fixing it in the plugin directory doesn't survive a sync, so reinstall a
-- correct supports_method from our side instead. none-ls calls the user's
-- on_init last, after it has assigned its own, and it does so before core
-- sends textDocument/didOpen -- which is the request that was failing.

local capability_map = vim.lsp.protocol._request_name_to_server_capability
    or vim.lsp._request_name_to_capability

--- Lets a user turn a null-ls capability off by declaring it `false` in
--- server_capabilities, same as none-ls intends.
local function capability_is_disabled(client, method)
  local required = capability_map and capability_map[method]
  -- A capability named after the method itself means "no related capability".
  local has_related = required and not (#required == 1 and required[1] == method)
  return not has_related or vim.tbl_get(client.server_capabilities, unpack(required)) == false
end

local function supports_method(client, method)
  if capability_is_disabled(client, method) then
    return false
  end

  local methods = require("null-ls.methods")

  -- null-ls broadcasts every capability on launch, so a method is only really
  -- supported if some source can run for this buffer's filetype.
  local internal_method = methods.map[method]
  if internal_method then
    return require("null-ls.generators").can_run(vim.bo.filetype, internal_method)
  end

  -- Methods with no internal counterpart (initialize, shutdown, ...).
  return methods.lsp[method] ~= nil
end

local user_on_init = lvim.lsp.null_ls.setup.on_init

lvim.lsp.null_ls.setup.on_init = function(client, initialize_result)
  client.supports_method = function(first, second)
    -- Accept both client:supports_method(m) and client.supports_method(m).
    local method = type(first) == "table" and second or first
    return supports_method(client, method)
  end

  if user_on_init then
    return user_on_init(client, initialize_result)
  end
end
