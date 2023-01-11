local elixirls_path = vim.fn.expand("$HOME/tools/elixir-ls/language_server.sh")

local entries = {
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

if not vim.g.started_by_firenvim then
  table.insert(entries, {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics

      opts.sources = vim.list_extend(opts.sources, {
        formatting.mix,
        diagnostics.credo,
      })
    end,
  })
end

return entries
