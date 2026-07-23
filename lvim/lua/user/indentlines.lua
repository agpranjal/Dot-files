-- Treesitter-based indent detection is back on: the `has-type?` crash that
-- forced it off (query_predicates.lua: "attempt to call method 'type' (a nil
-- value)") came from nvim-treesitter's pre-0.11 predicate signature, which is
-- now shimmed in user/treesitter-compat.lua.
lvim.builtin.indentlines.options.use_treesitter = true
