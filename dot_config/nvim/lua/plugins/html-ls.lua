return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        html = {
          filetypes = {
            "html",
            "heex",
            "eex",
            "elixir",
          },
        },
      },
    },
  },
}
