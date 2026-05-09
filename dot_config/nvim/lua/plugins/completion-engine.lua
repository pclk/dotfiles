return {
  -- Force-disable blink. It is currently crashing on first InsertEnter.
  { "saghen/blink.cmp", enabled = false },

  -- Use LazyVim's nvim-cmp extra instead.
  { import = "lazyvim.plugins.extras.coding.nvim-cmp" },
}
