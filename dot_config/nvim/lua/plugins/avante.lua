local avante_explain_code = [[
**Role: You are a Principal Software Engineer with a knack for explaining complex code clearly and concisely to junior developers.**

Considering the provided code, please act as a mentor and provide a comprehensive explanation.

Focus on providing an insightful and educational explanation that goes beyond a superficial understanding, enabling a less experienced developer to grasp the intricacies of the code and learn from its structure and potential improvements.

]]

local avante_document = [[
**Role: You are an experienced Technical Writer specializing in creating clear, accurate, and maintainable software documentation.**

Given the provided code, your task is to generate professional-grade documentation following industry best practices. Focus on clarity and completeness to ensure other developers can easily understand, use, and maintain this code.

Aim to create documentation that is both informative for new users and a reliable reference for experienced developers maintaining the codebase.

]]

local avante_log = [[
**Role: You are an expert in software observability and debugging, skilled at implementing effective logging strategies for complex systems.**

Considering the provided code, your goal is to enhance its logging capabilities to improve its debuggability, monitoring, and overall observability.

Provide specific log statement examples, indicating where they should be placed in the code and explaining the purpose and value of each log message for debugging and observability.

]]

-- prefill ask window WITHOUT submitting
local function ask(input)
  -- First open the sidebar without submitting
  require("avante.api").ask({ floating = false })

  -- Get the current sidebar instance
  local sidebar = require("avante").get()
  if not sidebar then
    return
  end

  -- Wait a bit for the input container to be ready
  vim.schedule(function()
    -- Set the text in the input container
    if sidebar.input_container and sidebar.input_container.bufnr then
      -- Split input into lines
      local lines = vim.split(input, "\n")
      vim.api.nvim_buf_set_lines(sidebar.input_container.bufnr, 0, -1, false, lines)

      -- Move cursor to the end of last line
      if sidebar.input_container.winid then
        vim.api.nvim_set_current_win(sidebar.input_container.winid)
        vim.cmd("normal! G$")
      end
    end
  end)
end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  -- keys = {
  --   {
  --     "<C-l>",
  --     function()
  --       local sidebar = require("avante").get()
  --       if sidebar and sidebar.input_container and sidebar.input_container.winid then
  --         vim.api.nvim_set_current_win(sidebar.input_container.winid)
  --       end
  --     end,
  --     desc = "Jump to Avante input",
  --   },
  -- },

  opts = {
    -- add any opts here
    behaviour = {
      auto_set_keymaps = false, -- disable all default keymaps
      minimize_diff = false,
    },
    windows = {
      width = 50,
      sidebar_header = { enabled = false },
      ask = {
        start_insert = false,
      },
    },
    hints = { enabled = false },
    mappings = {
      submit = {
        normal = "<C-s>",
      },
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },

  -- custom snippets for Avante Ask
  require("which-key").add({
    { "<leader>a", group = "Avante Ask" },
    {
      mode = { "n", "v" },
      {
        "<leader>aa",
        function()
          require("avante").toggle()
        end,
        desc = "Toggle sidebar",
      },
      {
        "<leader>ax",
        function()
          ask(avante_explain_code)
        end,
        desc = "Explain Code",
      },
      {
        "<leader>ad",
        function()
          ask(avante_document)
        end,
        desc = "Document Code",
      },
      {
        "<leader>al",
        function()
          ask(avante_log)
        end,
        desc = "Log Code",
      },
    },
  }),

  -- custom snippets for Avante Edit
  require("which-key").add({
    { "<leader>e", group = "Avante Edit" },
    {
      mode = { "v" },
      {
        "<leader>e",
        function()
          require("avante.api").edit()
        end,
        desc = "Edit",
      },
    },
  }),
}
