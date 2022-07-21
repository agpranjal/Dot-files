local M = {}

local ft = {
  [""] = "",
  conf = "",
  zsh = "",
}

function M.setup()
  require "ufo".setup {
    provider_selector = function(bufnr, filetype)
      return ft[filetype] or { "lsp", "indent" }
    end,
    preview = {
      win_config = {
        border = { '', '─', '', '', '', '─', '', '' },
        winhighlight = 'Normal:Folded',
        winblend = 0
      },
      mappings = {
        scrollU = '<pageup>',
        scrollD = '<pagedown>'
      }
    },
  }

  vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  vim.keymap.set('n', 'P', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      -- nvimlsp
      vim.lsp.buf.hover()
    end
  end)
end

return M
