-- Options are automatically loaded before lazy.nvim startup
-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.laststatus = 3
vim.go.background = "light"

-- Force LazyVim to use nvim-cmp instead of blink.cmp.
vim.g.lazyvim_cmp = "nvim-cmp"
