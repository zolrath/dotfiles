return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets" })
    end,
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = "~/.config/nvim/snippets/",
      telescope = { alsoSearchSnippetBody = true },
      jsonFormatter = "jq",
    },
    keys = {
      {
        "<Leader>he",
        function()
          require("scissors").editSnippet()
        end,
        desc = "Edit Snippet",
      },
      {
        "<Leader>ha",
        function()
          require("scissors").addNewSnippet()
        end,
        mode = { "n", "x" },
        desc = "Add new Snippet",
      },
    },
  },
}
