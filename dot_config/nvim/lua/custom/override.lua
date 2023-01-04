local M = {}

M.treesitter = {
  ensure_installed = {
    "html",
    "markdown",
    "yaml",
    "lua",
    "elixir",
    "surface",
    "heex",
    "eex",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    side = "right",
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "",
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "marksman",
    "html-lsp",
    "yaml-language-server",
    "elixir-ls",
  },
}

return M
