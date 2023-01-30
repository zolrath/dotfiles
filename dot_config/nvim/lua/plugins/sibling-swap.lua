return {
  {
    "Wansmer/sibling-swap.nvim",
    opts = {
      use_default_keymaps = false,
    },
    keys = function()
      return {
        {
          "mh",
          function()
            require("sibling-swap").swap_with_left()
          end,
          desc = "Swap with left",
        },
        {
          "ml",
          function()
            require("sibling-swap").swap_with_right()
          end,
          desc = "Swap with right",
        },
        {
          "mH",
          function()
            require("sibling-swap").swap_with_left_with_opp()
          end,
          desc = "Swap with left with operator",
        },
        {
          "mL",
          function()
            require("sibling-swap").swap_with_right_with_opp()
          end,
          desc = "Swap with right with operator",
        },
      }
    end,
  },
}
