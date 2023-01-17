return {
  {
    "xeluxee/competitest.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = true,
    init = function()
      local wk = require("which-key")
      wk.register({
        mode = { "n" },
        ["<leader>cc"] = { name = "+competitest" },
      })
    end,
    keys = {
      { "<leader>cca", "<cmd>CompetiTestAdd<cr>", desc = "Add new testcase" },
      { "<leader>cce", "<cmd>CompetiTestEdit<cr>", desc = "Edit existing testcase" },
      { "<leader>ccd", "<cmd>CompetiTestDelete<cr>", desc = "Delete existing testcase" },
      { "<leader>ccr", "<cmd>CompetiTestRun<cr>", desc = "Run testcases" },
      { "<leader>ccg", "<cmd>CompetiTestReceive<cr>", desc = "Get testcases from site" },
    },
    opts = {
      testcases_use_single_file = true,
      editor_ui = {
        normal_mode_mappings = {
          save_and_close = { "<C-s>", "s" },
        },
      },
    },
  },
}
