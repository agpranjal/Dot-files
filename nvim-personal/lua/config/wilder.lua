local M = {}

function M.setup()
  require "wilder".setup {
    modes = { ':', '/', '?' },
  }

  local wilder = require "wilder"

  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline({
        -- sets the language to use, 'vim' and 'python' are supported
        language = 'python',
        -- 0 turns off fuzzy matching
        -- 1 turns on fuzzy matching
        -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
        fuzzy = 2,
      }),
      wilder.python_search_pipeline({
        -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
        pattern = wilder.python_fuzzy_pattern(),
        -- omit to get results in the order they appear in the buffer
        sorter = wilder.python_difflib_sorter(),
        -- can be set to 're2' for performance, requires pyre2 to be installed
        -- see :h wilder#python_search() for more details
        engine = 're',
      })
    ),
  })

  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.python_file_finder_pipeline({
        -- to use ripgrep : {'rg', '--files'}
        -- to use fd      : {'fd', '-tf'}
        file_command = { 'find', '.', '-type', 'f', '-printf', '%P\n' },
        -- to use fd      : {'fd', '-td'}
        dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
        -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
        -- found at https://github.com/nixprime/cpsm
        filters = { 'fuzzy_filter', 'difflib_sorter' },
      }),
      wilder.cmdline_pipeline(),
      wilder.python_search_pipeline()
    ),
  })

  wilder.set_option('renderer', wilder.wildmenu_renderer({
    -- highlighter applies highlighting to the candidates
    highlighter = wilder.basic_highlighter(),
    -- separator = ' · ',
    -- left = { ' ', wilder.wildmenu_spinner(), ' ' },
    right = { ' ', wilder.wildmenu_index() },
  }))
end

return M
