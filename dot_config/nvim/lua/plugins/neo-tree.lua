return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      mappings = {
        ["O"] = {
          function(state)
            local node = state.tree:get_node()
            local filesystem_commands = require("neo-tree.sources.filesystem.commands")
            filesystem_commands.expand_all_nodes(state, node)
          end,
        },
      },
    },
  },
  keys = {
    {
      "<leader>ge",
      false,
    },
    {
      "<leader>be",
      false,
    },
  },
}
