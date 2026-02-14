return {
  {
    --"chrisgrieser/nvim-chainsaw",
    "zolrath/nvim-chainsaw",
    branch = "python-logs",
    event = "VeryLazy",
    opts = {
      marker = "🪵",
    },
    keys = {
      { "<leader>l", "", desc = "+log", mode = { "n", "v" } },
      {
        "<leader>ll",
        function()
          require("chainsaw").variableLog()
        end,
        mode = { "n", "v" },
        desc = "Log variable",
      },
      {
        "<leader>lo",
        function()
          require("chainsaw").objectLog()
        end,
        mode = { "n", "v" },
        desc = "Log object",
      },
      {
        "<leader>lt",
        function()
          require("chainsaw").timeLog()
        end,
        mode = { "n", "v" },
        desc = "Log time",
      },
      {
        "<leader>ld",
        function()
          require("chainsaw").removeLogs()
        end,
        mode = { "n", "v" },
        desc = "Delete logs",
      },
    },
  },
}
