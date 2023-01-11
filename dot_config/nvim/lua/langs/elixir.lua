local elixirls_path = vim.fn.expand("$HOME/tools/elixir-ls/language_server.sh")

return {
  -- add elixir to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "elixir", "heex" })
    end,
  },

  -- add html/css/emmet to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "elixir-ls" })
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          setup = {
            cmd = { elixirls_path },
            filetypes = { "elixir", "eelixir", "heex", "eex", "surface" },
          },
        },
      },
    },
  },
}
