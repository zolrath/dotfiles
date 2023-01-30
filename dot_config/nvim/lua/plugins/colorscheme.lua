return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    config = function()
      local catppuccin = require("catppuccin")
      catppuccin.setup({
        flavour = "macchiato",
        transparent_background = false,
      })
      catppuccin.load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
