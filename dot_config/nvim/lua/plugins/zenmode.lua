return {
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    keys = {
      {
        "<Leader>z",
        "<cmd>ZenMode<CR>",
        desc = "Toggle zen mode",
      },
    },
  },
}
