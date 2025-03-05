return {
  "luk400/vim-jukit",
  init = function()
    vim.g.jukit_mappings = 0

    require("which-key").add({
      { "<leader>r", group = "Jupyter" },
      -- {
      --   "<leader>j",
      --   "<cmd>call jukit#cells#jump_to_next_cell()<cr>",
      --   desc = "Jump to next cell",
      -- },
      -- {
      --   "<leader>k",
      --   "<cmd>call jukit#cells#jump_to_previous_cell()<cr>",
      --   desc = "Jump to previous cell",
      -- },
      -- {
      --   "<leader>r<space>",
      --   "<cmd>call jukit#send#section(1)<cr>",
      --   desc = "Run code",
      -- },
      -- {
      --   "<leader>ro",
      --   "<cmd>call jukit#cells#create_below(0)<cr>",
      --   desc = "Create code block below",
      -- },
      -- {
      --   "<leader>rO",
      --   "<cmd>call jukit#cells#create_above(0)<cr>",
      --   desc = "Create code block above",
      -- },
      -- {
      --   "<leader>rt",
      --   "<cmd>call jukit#cells#create_below(1)<cr>",
      --   desc = "Create md block below",
      -- },
      -- {
      --   "<leader>rT",
      --   "<cmd>call jukit#cells#create_above(1)<cr>",
      --   desc = "Create md block above",
      -- },
      -- {
      --   "<leader>rj",
      --   "<cmd>call jukit#cells#move_down()<cr>",
      --   desc = "Move down",
      -- },
      -- {
      --   "<leader>rk",
      --   "<cmd>call jukit#cells#move_up()<cr>",
      --   desc = "Move up",
      -- },
      -- {
      --   "<leader>rs",
      --   "<cmd>call jukit#cells#split()<cr>",
      --   desc = "Split block",
      -- },
      -- {
      --   "<leader>rd",
      --   "<cmd>call jukit#cells#delete()<cr>",
      --   desc = "Delete block",
      -- },
      -- {
      --   "<leader>rm",
      --   "<cmd>call jukit#cells#merge_below()<cr>",
      --   desc = "Merge below",
      -- },
      -- {
      --   "<leader>rM",
      --   "<cmd>call jukit#cells#merge_above()<cr>",
      --   desc = "Merge above",
      -- },
      -- {
      --   "<leader>rS",
      --   "<cmd>call jukit#splits#output()<cr>",
      --   desc = "Output Split",
      -- },
      -- {
      --   "<leader>rD",
      --   "<cmd>call jukit#splits#close_output_split()<cr>",
      --   desc = "Close output split",
      -- },
      {
        "<leader>rp",
        "<cmd>call jukit#convert#notebook_convert('jupyter-notebook')<cr>",
        desc = "Convert between ipynb & py",
      },
    })
  end,
}
