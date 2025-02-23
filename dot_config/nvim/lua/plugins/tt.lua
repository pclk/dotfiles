return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>p",
      function()
        local term = require("snacks").terminal
        term.toggle("tt -n 25 -noskip -oneshot -noreport -notheme", {
          win = {
            width = 0.5,
            height = 0.25,
            row = 0.375,
            col = 0.25,
            border = "rounded",
          },
        })
      end,
      desc = "Toggle floating terminal with tt",
    },
  },
  ---@type snacks.Config
  opts = {
    terminal = {
      win = {
        style = "terminal",
      },
    },
  },
}
