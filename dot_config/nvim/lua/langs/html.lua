return {
  -- add html/css to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html", "css" })
    end,
  },

  -- add html/css to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html-lsp", "css-lsp" })
    end,
  },

  -- add html lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
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
