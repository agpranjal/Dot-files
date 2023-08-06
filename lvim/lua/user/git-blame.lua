vim.cmd [[
  highlight default link gitblame SpecialComment
  let g:gitblame_message_template = '     <author> • <date> • <summary>'
  let g:gitblame_date_format = '%r'
  let g:gitblame_enabled = 1
  let g:gitblame_message_when_not_committed = ''

  function! SetGitBlamerHighlight()
    highlight default link gitblame Comment
    hi gitblame guifg=#666666

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
