vim.cmd("autocmd FileType * set formatoptions-=cro")

vim.cmd([[
  " Triger `autoread` when files changes on disk
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
              \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

  " Notification after file change
  " autocmd FileChangedShellPost *
  "   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  autocmd FileChangedShellPost *
  \ lua vim.notify("Buffer reloaded - File changed on disk.", "warn", {title="Nvim"})
]])

vim.cmd([[
  " Show numberline in vim help buffers
  augroup HelpTextNumberLine
    autocmd!
    autocmd BufEnter * lua if (vim.bo.filetype == "help") then vim.cmd "setlocal number" end
  augroup end
]])

vim.cmd([[
  " Escape from diffferent window types using <esc>
  augroup ExitUsingEscape
    autocmd!
    autocmd FileType qf,vim nnoremap <buffer> <silent> <esc> :q<cr>
    autocmd FileType spectre_panel nnoremap <buffer> <silent> q :q<cr>
    autocmd BufEnter * lua if (vim.bo.filetype == "help") then vim.cmd "nnoremap <buffer> <silent> <esc> :q<cr>" end
  augroup end
]])

vim.cmd([[
  function! ColorschemeFix()
    highlight Comment cterm=italic gui=italic
    if index(["molokai", "molokayo"], get(g:, "colors_name")) >= 0
      highlight MatchParen guibg=black guifg=#FD971F
    endif

    if index(["vscode"], get(g:, "colors_name")) >= 0
      highlight @comment gui=italic
    endif

    " Set cursor style
    if index(["molokayo"], get(g:, "colors_name")) >= 0
      set guicursor=i:ver25-iCursor
    endif

    " Make neo-tree background darker
    if index(["molokai", "molokayo", "vscode"], get(g:, "colors_name")) >= 0
      " hi NeoTreeNormal guibg=#131313
      " hi NeoTreeNormalNC guibg=#131313
      hi NeoTreeNormal guibg=#000000
      hi NeoTreeNormalNC guibg=#000000
    endif
  endfunction

  augroup VimColorSchemeFix
    autocmd!
    autocmd ColorScheme * silent! call ColorschemeFix()
  augroup end
]])
