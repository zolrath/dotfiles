return {
  {
    "isak102/ghostty.nvim",
    config = function()
      require("ghostty").setup()
    end,
  },
  {
    "bezhermoso/tree-sitter-ghostty",
    build = "make nvim_install",
    ft = "ghostty",
  },
}
