return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets" })
    end,
  },
}
