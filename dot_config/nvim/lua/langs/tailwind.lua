local tailwind_filetypes = {
  "html",
  "typescriptreact",
  "javascriptreact",
  "css",
  "sass",
  "scss",
  "less",
  "javascript",
  "typescript",
  "heex",
  "elixir",
}
return {
  -- add tailwind to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "tailwindcss-language-server" })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      opts.sources = vim.list_extend(opts.sources, {
        formatting.rustywind.with({
          filetypes = tailwind_filetypes,
        }),
      })
    end,
  },
  -- add tailwind
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes = tailwind_filetypes,
          init_options = {
            userLanguages = {
              elixir = "phoenix-heex",
              eruby = "erb",
              heex = "phoenix-heex",
              svelte = "html",
              surface = "phoenix-heex",
            },
          },
          handlers = {
            ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
              vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
            end,
          },
          settings = {
            includeLanguages = {
              typescript = "javascript",
              typescriptreact = "html",
              ["html-eex"] = "html",
              ["phoenix-heex"] = "html",
              heex = "html",
              eelixir = "html",
              elixir = "html",
              elm = "html",
              erb = "html",
              svelte = "html",
              surface = "html",
            },
            tailwindCSS = {
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
              },
              classAttributes = {
                "class",
                "className",
                "classList",
                "ngClass",
              },
              experimental = {
                classRegex = {
                  [[class= "([^"]*)]],
                  [[class: "([^"]*)]],
                  '~H""".*class="([^"]*)".*"""',
                },
              },
              validate = true,
            },
          },
        },
      },
    },
  },
}
