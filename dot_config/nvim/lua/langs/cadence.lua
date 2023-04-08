return {
  {
    "Cian911/vim-cadence",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cadence = {
          setup = {
            cmd = { "flow", "cadence", "language-server" },
          },
        },
      },
    },
  },
}
