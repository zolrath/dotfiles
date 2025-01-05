return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = function(_, opts)
      require("blink.cmp").setup({
        sources = {
          completion = {
            enabled_providers = { "lsp", "path", "snippets", "buffer", "markdown" },
          },
          providers = {
            markdown = { name = "RenderMarkdown", module = "render-markdown.integ.blink" },
          },
        },
      })
    end,
  },
}
