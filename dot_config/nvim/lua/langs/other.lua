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
        "yaml",
      })
    end,
  },
}
