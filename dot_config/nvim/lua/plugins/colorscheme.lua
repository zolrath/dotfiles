return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      local catppuccin = require("catppuccin")
      catppuccin.setup({
        flavour = "macchiato",
        transparent_background = false,

        integrations = {
          which_key = true,
          cmp = true,
          telescope = true,
          mini = true,
          leap = true,
          noice = true,
          dap = true,
          illuminate = true,
          ts_rainbow = true,
          neotree = true,
        },
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
