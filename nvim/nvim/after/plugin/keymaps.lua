-- Remap leader and local leader to <Space>
--vim.keymap.set("", "<space>", "<nop>", { noremap = true, silent = true })

-- Use :D to remove search highlight
vim.api.nvim_create_user_command("D", "nohlsearch", { nargs = 0 })

-- Use :W to write
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- Use :Wq to write and quit
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })

-- Scroll half screen up and down with pageup and pagedown
vim.keymap.set("", "<pageup>", "7<up>")
vim.keymap.set("", "<pagedown>", "7<down>")
