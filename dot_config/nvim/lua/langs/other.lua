return {
  {
    "NoahTheDuke/vim-just",
    ft = { "just" },
  },
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
      opts.highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 10 * 1024 * 1024 -- 10 MB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            vim.notify("Large file, treesitter disabled")
            return true
          end
        end,
      }
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
        astro = {
          setup = {},
        },
      },
    },
  },
}
