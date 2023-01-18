return {
  {
    "catppuccin/nvim",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
      })

      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
