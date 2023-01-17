return {
  {
    "Wansmer/sibling-swap.nvim",
    event = "InsertEnter",
    opts = {
      use_default_keymaps = false,
    },
    keys = function()
      local m = require("sibling-swap")
      return {
        { "mh", m.swap_with_left, desc = "Swap with left" },
        { "ml", m.swap_with_right, desc = "Swap with right" },
        { "mH", m.swap_with_left_with_opp, desc = "Swap with left with operator" },
        { "mL", m.swap_with_right_with_opp, desc = "Swap with right with operator" },
      }
    end,
  },
}
