return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
    event = "BufReadPost",
    keys = {
      {
        "<C-i>",
        function()
          local lsp_lines = require("lsp_lines")
          local show_text = not lsp_lines.toggle()
          vim.diagnostic.config({
            virtual_text = show_text and { spacing = 4, prefix = "●" } or false,
          })
        end,
        desc = "Toggle lsp_lines",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        virtual_lines = false,
        severity_sort = true,
      },
    },
  },
}
