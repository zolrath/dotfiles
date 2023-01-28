return {
  {
    "Sup3Legacy/fontsize.nvim",
    event = "BufReadPost",
    init = function()
      require("fontsize").init({
        font = "JetBrainsMono Nerd Font Mono",
        min = 12,
        default = 18,
        max = 32,
        step = 1,
      })
    end,
    keys = {
      {
        "<Leader>uz",
        "<cmd>FontIncrease<CR>",
        desc = "Increase font size",
      },
      {
        "<Leader>uZ",
        "<cmd>FontDecrease<CR>",
        desc = "Decrease font size",
      },
    },
  },
}
