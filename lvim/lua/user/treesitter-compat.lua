-- Neovim 0.11+ hands query predicate/directive handlers a `match` table shaped
-- table<capture_id, TSNode[]>. The master branch of nvim-treesitter (frozen
-- upstream in favour of the `main` rewrite) still expects table<capture_id,
-- TSNode>, so its handlers call node methods on a plain list. Opening any HTML
-- file crashed the highlighter this way: queries/html_tags/injections.scm uses
-- (#set-lang-from-mimetype! @_type) for <script type="...">, and the handler's
-- get_node_text() blew up with "attempt to call method 'range' (a nil value)".
--
-- Patch the registration functions before nvim-treesitter loads so its legacy
-- handlers get a legacy-shaped match, and so its force-registrations don't
-- clobber the equivalents that core Neovim now implements correctly.

local query = require("vim.treesitter.query")

-- Core owns these now; nvim-treesitter re-registers them with force=true.
local core_owned = {
  ["has-ancestor?"] = true,
  ["has-parent?"] = true,
  ["trim!"] = true,
}

-- Legacy handlers that need one node per capture instead of a list.
local needs_single_node = {
  ["nth?"] = true,
  ["is?"] = true,
  ["has-type?"] = true,
  ["set-lang-from-mimetype!"] = true,
  ["set-lang-from-info-string!"] = true,
  ["downcase!"] = true,
}

---@param match table<integer, TSNode[]>
---@return table<integer, TSNode>
local function single_nodes(match)
  local out = {}
  for id, nodes in pairs(match) do
    -- Pre-0.11 semantics: the last node captured by an id wins.
    out[id] = type(nodes) == "table" and nodes[#nodes] or nodes
  end
  return out
end

local function wrap(register)
  return function(name, handler, opts)
    if core_owned[name] then
      return
    end

    if needs_single_node[name] then
      local legacy = handler
      handler = function(match, pattern, source, pred, metadata)
        return legacy(single_nodes(match), pattern, source, pred, metadata)
      end
    end

    return register(name, handler, opts)
  end
end

query.add_predicate = wrap(query.add_predicate)
query.add_directive = wrap(query.add_directive)

-- Safety net in case nvim-treesitter registered its handlers before we got here.
if package.loaded["nvim-treesitter.query_predicates"] then
  package.loaded["nvim-treesitter.query_predicates"] = nil
  require("nvim-treesitter.query_predicates")
end
