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
    -- dependencies = {
    --   "nvim-telescope/telescope.nvim",
    --   {
    --     "folke/which-key.nvim",
    --     optional = true,
    --     opts = {
    --       spec = {
    --         ["<leader>m"] = { group = "+snippets" },
    --       },
    --     },
    --   },
    -- },
    opts = {
      snippetDir = "~/.config/nvim/snippets/",
      telescope = { alsoSearchSnippetBody = true },
      jsonFormatter = "jq",
    },
    keys = {
      {
        "<leader>m",
        group = "snippets",
      },
      {
        "<Leader>me",
        function()
          require("scissors").editSnippet()
        end,
        desc = "Edit Snippet",
      },
      {
        "<Leader>ma",
        function()
          require("scissors").addNewSnippet()
        end,
        mode = { "n", "x" },
        desc = "Add new Snippet",
      },
    },
  },
}
