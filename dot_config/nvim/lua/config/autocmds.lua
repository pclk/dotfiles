-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Avante",
  callback = function()
    vim.keymap.set({ "n", "o" }, "<ESC>", "<Nop>", { buffer = true })
  end,
})

-- The following is not needed because AvanteChat includes no search and replace.
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "DeleteSystemPrompt",
--   callback = function()
--     require("avante.config").override({ system_prompt = "" })
--     vim.notify("System prompt deleted! 🍿", vim.log.levels.INFO)
--   end,
-- })
--
-- vim.keymap.set("n", "<leader>ad", function()
--   vim.api.nvim_exec_autocmds("User", { pattern = "DeleteSystemPrompt" })
-- end, { desc = "Delete System Prompt" })
