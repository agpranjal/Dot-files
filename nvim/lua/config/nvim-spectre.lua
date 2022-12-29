local M = {}

local whichkey = require("which-key")

function M.setup()
  require "spectre".setup({
    color_devicons     = true,
    open_cmd           = 'vnew',
    live_update        = false, -- auto excute search again when you write any file in vim
    is_open_target_win = true, --open file on opener window
    is_insert_mode     = false, -- start open panel on is_insert_mode
    line_sep_start     = '┌-----------------------------------------',
    result_padding     = '¦  ',
    line_sep           = '└-----------------------------------------',
    -- is_insert_mode = true,
    highlight          = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete"
    },
    mapping            = {
      ['toggle_line'] = {
        map = "<leader>ss",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "Select Current Item (toggle)"
      },
      ['enter_file'] = {
        map = "<leader>s<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "Goto File"
      },
      ['send_to_qf'] = {
        map = "<leader>sq",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "Send All Items To Quickfix"
      },
      -- ['replace_cmd'] = {
      --   map = "<leader>sr",
      --   cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
      --   desc = "input replace vim command"
      -- },
      ['show_option_menu'] = {
        map = "<leader>so",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "Show Options"
      },
      ['run_current_replace'] = {
        map = "<leader>src",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "Replace Current Line"
      },
      ['run_replace'] = {
        map = "<leader>sra",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "Replace All"
      },
      ['change_view_mode'] = {
        map = "<leader>sv",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "Change Result View Mode"
      },
      ['toggle_live_update'] = {
        map = "<leader>su",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        desc = "Live Update (toggle)"
      },
      ['toggle_ignore_case'] = {
        map = "<leader>si",
        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
        desc = "Ignore Case (toggle)"
      },
      ['toggle_ignore_hidden'] = {
        map = "<leader>sh",
        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
        desc = "Search Hidden Files (toggle)"
      },
      -- you can put your mapping here it only use normal mode
    },
    -- find_engine        = {
    --   -- rg is map with finder_cmd
    --   ['rg'] = {
    --     cmd = "rg",
    --     -- default args
    --     args = {
    --       '--color=never',
    --       '--no-heading',
    --       '--with-filename',
    --       '--line-number',
    --       '--column',
    --     },
    --     options = {
    --       ['ignore-case'] = {
    --         value = "--ignore-case",
    --         icon = "[I]",
    --         desc = "ignore case"
    --       },
    --       ['hidden'] = {
    --         value = "--hidden",
    --         desc = "hidden file",
    --         icon = "[H]"
    --       },
    --       -- you can put any rg search option you want here it can toggle with
    --       -- show_option function
    --     }
    --   },
    --   ['ag'] = {
    --     cmd = "ag",
    --     args = {
    --       '--vimgrep',
    --       '-s'
    --     },
    --     options = {
    --       ['ignore-case'] = {
    --         value = "-i",
    --         icon = "[I]",
    --         desc = "ignore case"
    --       },
    --       ['hidden'] = {
    --         value = "--hidden",
    --         desc = "hidden file",
    --         icon = "[H]"
    --       },
    --     },
    --   },
    -- },
    -- replace_engine     = {
    --   ['sed'] = {
    --     cmd = "sed",
    --     args = nil
    --   },
    --   options = {
    --     ['ignore-case'] = {
    --       value = "--ignore-case",
    --       icon = "[I]",
    --       desc = "ignore case"
    --     },
    --   }
    -- },
    -- default            = {
    --   find = {
    --     --pick one of item in find_engine
    --     cmd = "rg",
    --     options = { "ignore-case" }
    --   },
    --   replace = {
    --     --pick one of item in replace_engine
    --     cmd = "sed"
    --   }
    -- },
    -- replace_vim_cmd    = "cdo",
  })

  -- Key mapping
  local keymap_s = {
    name = "Search/Replace",
    s = {
      name = "Search/Replace",
      o = {
        name = "Open",
        w = { "<cmd>lua require 'spectre'.open()<CR>", "Search Across Workspace" },
        f = { "<cmd>lua require 'spectre'.open_file_search()<CR>", "Search In Current File" },
      },
      -- ["<CR>"] = { "<cmd>lua require('spectre.actions').select_entry()<CR>", "Goto Current File" },
      -- q = { "<cmd>lua require('spectre.actions').send_to_qf()<CR>", "Send All Items To Quickfix" },
      -- -- c = { "<cmd>lua require('spectre.actions').replace_cmd()<CR>", "Input Replace Vim Command" },
      -- O = { "<cmd>lua require('spectre').show_options()<CR>", "Show Options" },
      -- r = { "<cmd>lua require('spectre.actions').run_current_replace()<CR>", "Replace Current Item" },
      -- R = { "<cmd>lua require('spectre.actions').run_replace()<CR>", "Replace All" },
      -- v = { "<cmd>lua require('spectre').change_view()<CR>", "Change Result View Mode" },
      -- u = { "<cmd>lua require('spectre').toggle_live_update()<CR>", "Live Update (toggle)" },
      -- i = { "<cmd>lua require('spectre').change_options('ignore-case')<CR>", "Ignore Case (toggle)" },
      -- h = { "<cmd>lua require('spectre').change_options('hidden')<CR>", "Show From Hidden Files (toggle)" }

      -- s = { "Select/Unselect Current Item" },

      -- c = { "<cmd>lua require('spectre.actions').replace_cmd()<CR>", "Input Replace Vim Command" },
      s = { "Select/Unselect Current Item" },
      ["<CR>"] = { "Goto Current File" },
      q = { "Send All Items To Quickfix" },
      O = { "Show Options" },
      r = {
        name = "Replace",
        c = { "Replace Current Item" },
        a = { "Replace All" },
      },
      v = { "Change Result View Mode" },
      u = { "Live Update (toggle)" },
      i = { "Ignore Case (toggle)" },
      h = { "Search Hidden Files (toggle)" }
    }
  }
  whichkey.register(keymap_s, { mode = "n", prefix = "<leader>" })

  local keymap_s_visual = {
    s = {
      name = "Search/Replace",
      o = {
        name = "Open",
        v = { ":'<,'>lua require('spectre').open_visual()<cr>", "Search Visual Selection (workspace)" }
      }
    }
  }
  whichkey.register(keymap_s_visual, { mode = "v", prefix = "<leader>" })
end

return M
