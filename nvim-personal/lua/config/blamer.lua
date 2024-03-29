local M = {}

local whichkey = require "which-key"

function M.setup()
  vim.cmd [[
    let g:blamer_enabled = 1
    let g:blamer_delay = 50
    let g:blamer_relative_time = 1
    let g:blamer_template = "     <committer> • <committer-time> • <summary>"

    function! SetGitBlamerHighlight()
      highlight link Blamer Comment
      hi Blamer guifg=#666666
      
      " if get(g:, "colors_name") == "vscode"
      "   highlight link Blamer gitcommitHeader
      " endif
    endfunction

    call SetGitBlamerHighlight()

    augroup VimGitBlamerColorSchemeFix
      autocmd!
      autocmd ColorScheme * silent! call SetGitBlamerHighlight()
    augroup end
  ]]

  local keymap = {
    g = {
      name = "Git",
      B = {
        name = "Blame",
        t = { "<cmd>BlamerToggle<cr>", "Toggle" }
      }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
