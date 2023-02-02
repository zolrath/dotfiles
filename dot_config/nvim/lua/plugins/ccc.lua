return {
  {
    "uga-rosa/ccc.nvim",
    --event = "BufReadPost",
    config = function()
      require("ccc").setup({ highlighter = { auto_enable = true } })
    end,
    keys = {
      {
        "<Leader>pc",
        "<cmd>CccPick<cr>",
        desc = "Open color picker",
      },
    },
  },
}
