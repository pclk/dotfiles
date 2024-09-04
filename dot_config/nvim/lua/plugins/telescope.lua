return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><space>",
      LazyVim.pick("find_files", { no_ignore = true }),
      desc = "Find files hidden off",
    },
  },
}
