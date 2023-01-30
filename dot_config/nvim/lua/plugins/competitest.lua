return {
  {
    "xeluxee/competitest.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>cc", desc = "+competitest" },
      { "<leader>ccg", desc = "+competitest/get" },
      { "<leader>cca", "<cmd>CompetiTestAdd<cr>", desc = "Add new testcase" },
      { "<leader>cce", "<cmd>CompetiTestEdit<cr>", desc = "Edit existing testcase" },
      { "<leader>ccd", "<cmd>CompetiTestDelete<cr>", desc = "Delete existing testcase" },
      { "<leader>ccr", "<cmd>CompetiTestRun<cr>", desc = "Run testcases" },
      { "<leader>ccgt", "<cmd>CompetiTestReceive testcases<cr>", desc = "Get testcases from site" },
      { "<leader>ccgp", "<cmd>CompetiTestReceive problem<cr>", desc = "Get source and testcases from site" },
      { "<leader>ccgc", "<cmd>CompetiTestReceive contest<cr>", desc = "Get entire contest from site" },
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
