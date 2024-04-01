return {
  { "czheo/mojo.vim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mojo = {
          setup = {},
        },
      },
    },
  },
}
