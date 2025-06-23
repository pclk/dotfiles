return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = {
        lsp = { auto_attach = true },
        window = {
          position = { row = "50%", col = "95%" },
        },
      },
      keys = {
        { "<leader>h", "<cmd>Navbuddy<cr>", desc = "Symbol floating window" },
      },
    },
  },
  -- your lsp config or other stuff
}
