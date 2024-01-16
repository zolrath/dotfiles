local util = require("lspconfig").util

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
  "astro",
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
    "nvimtools/none-ls.nvim",
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
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- add tailwind
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes = tailwind_filetypes,
          root_dir = util.root_pattern("tailwind.config.js", ".git"),
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
                  'class[:]\\s*"([^"]*)"',
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
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
