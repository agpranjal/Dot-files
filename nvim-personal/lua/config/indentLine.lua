local M = {}

function M.setup()
  vim.cmd [[
    let g:indentLine_setColors = 0
    let g:indentLine_char_list = ["│"]
    let g:markdown_syntax_conceal=0
  ]]
end

return M
