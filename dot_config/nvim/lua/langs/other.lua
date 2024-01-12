return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "diff",
        "dockerfile",
        "gitcommit",
        "git_rebase",
        "markdown",
        "regex",
        "odin",
        "zig",
        "yaml",
        "astro",
        "terraform",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ols = {
          setup = {},
        },
        zls = {
          setup = {},
        },
      },
    },
  },
}
