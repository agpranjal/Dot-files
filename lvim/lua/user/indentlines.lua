-- Disable treesitter-based indent detection for indent-blankline.
-- On Neovim 0.11+, nvim-treesitter's `has-type?`/`kind-eq?` query predicates
-- duplicate predicates now built into core Neovim, and crash
-- (query_predicates.lua: "attempt to call method 'type' (a nil value)")
-- whenever indent-blankline asks nvim-treesitter for the current line's indent.
lvim.builtin.indentlines.options.use_treesitter = false
