return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  -- keys = {
  --   {
  --     "<leader><space>",
  --     LazyVim.pick("find_files", { no_ignore = true }),
  --     desc = "Find files hidden off",
  --   },
  -- },
  --
  -- opts = function(_, opts)
  --   local actions = require("telescope.actions")
  --   opts.defaults = vim.tbl_extend("force", opts.defaults or {}, {
  --     mappings = {
  --       i = {
  --         ["<C-x>"] = actions.which_key,
  --         ["<C-h>"] = actions.select_vertical,
  --         ["<C-v>"] = actions.select_horizontal,
  --         ["<C-f>"] = actions.nop,
  --         ["<C-b>"] = actions.nop,
  --         ["<C-t>"] = actions.nop,
  --         ["<C-T>"] = actions.nop,
  --       },
  --       n = {},
  --     },
  --   })
  -- end,
}
