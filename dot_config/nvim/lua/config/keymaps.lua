-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")

-- <C-c> to have no errors
vim.keymap.set("i", "<C-c>", "<esc>", { remap = true })

-- emacs + vim
vim.keymap.set("i", "<C-a>", "<esc>I", { remap = true })
vim.keymap.set("i", "<C-e>", "<esc>A", { remap = true })
vim.keymap.set("i", "<C-o>", "<esc>o", { remap = true })

-- move lines remap to alt-j and alt-k.
vim.keymap.set("n", "∆", "<cmd>m .+1<cr>==", { remap = true })
vim.keymap.set("n", "˚", "<cmd>m .-2<cr>==", { remap = true })
vim.keymap.set("i", "∆", "<esc><cmd>m .+1<cr>==gi", { remap = true })
vim.keymap.set("i", "˚", "<esc><cmd>m .-2<cr>==gi", { remap = true })
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { remap = true })
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { remap = true })

-- new md file
vim.keymap.set("n", "<leader>fn", "<cmd>e .md<cr>", { desc = "New Markdown File" })

-- I hate tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

-- no need floating term, just use tmux
-- vim.keymap.del("n", "<leader>ft")
-- vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")

-- no need changelogs of lazyvim
vim.keymap.del("n", "<leader>L")
