return {
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    opts = {
      backdrop = 1,
      window = {
        options = {
          number = false,
          relativenumber = false,
        },
      },
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
