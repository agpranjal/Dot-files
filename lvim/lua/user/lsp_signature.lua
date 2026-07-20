require "lsp_signature".on_attach({
  hint_enable = false,
  cursorhold_update = false, -- avoids a crash in helper.lua's str_utfindex call on Neovim 0.10+
})
