local entries = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "eex", "elixir" })
    end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    --"zolrath/elixir-tools.nvim",
    --branch = "add-indentkeys-customization",
    -- event = { "BufReadPre", "BufNewFile" },
    ft = { "elixir" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        credo = {},
        elixirls = {
          enabled = true,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = false,
          }),
          on_attach = function(client, bufnr)
            -- whatever keybinds you want, see below for more suggestions
            vim.keymap.set("n", "<space>pf", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>pt", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "tpope/vim-projectionist",
    },
  },
  -- add endwise for automatic end insertion
  {
    "RRethy/nvim-treesitter-endwise",
    event = "BufReadPost",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      endwise = {
        enable = true,
      },
    },
  },
}

if not vim.g.started_by_firenvim then
  table.insert(entries, {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics

      opts.sources = vim.list_extend(opts.sources, {
        formatting.mix,
        --diagnostics.credo,
      })
    end,
  })
end

return entries
