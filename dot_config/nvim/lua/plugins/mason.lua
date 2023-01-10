return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "elixir-ls",
        "emmet-ls",
        "html-lsp",
        "tailwindcss-language-server",
      },
    },
  },
}
