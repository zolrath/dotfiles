return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.special.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
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
