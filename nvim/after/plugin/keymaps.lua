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

-- Use <leader><right> and <leader><left> to resize vertical splits
vim.keymap.set("", "<leader><right>", ":vertical resize +5<cr>")
vim.keymap.set("", "<leader><left>", ":vertical resize -5<cr>")
