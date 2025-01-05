return {
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "SmiteshP/nvim-navic",
    },
    lazy = false,
    opts = { lsp = { auto_attach = true }, window = { border = "single" } },
    keys = {
      { "<leader>cn", "<cmd>Navbuddy<cr>", desc = "Navbuddy navigate symbols" },
    },
  },
}
