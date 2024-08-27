return {
  "echasnovski/mini.animate",
  version = "*",
  opts = function()
    local animate = require("mini.animate")
    animate.setup()

    -- Custom function to scroll with animation
    local function scroll_with_animation(scroll_command)
      return function()
        local win_height = vim.api.nvim_win_get_height(0)
        local scroll_amount = math.floor(win_height / 2)

        vim.cmd(scroll_command .. scroll_amount)
        animate.execute_after("scroll", "normal! zz")
      end
    end

    -- Set up keymaps
    vim.keymap.set("n", "<C-u>", scroll_with_animation("normal! "), { desc = "Scroll up half page with animation" })
    vim.keymap.set("n", "<C-d>", scroll_with_animation("normal! "), { desc = "Scroll down half page with animation" })
  end,
}
