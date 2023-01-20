return {
  {
    "Canop/nvim-bacon",
    keys = {
      {
        "<leader>rn",
        "<cmd>BaconLoad<cr><cmd>w<cr><cmd>BaconNext<cr>",
        desc = "Jump to next issue listed in bacon",
      },
      {
        "<leader>rl",
        "<cmd>BaconList<cr>",
        desc = "Open bacon issue list",
      },
    },
  },
}
