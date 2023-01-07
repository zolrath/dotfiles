local M = {}

M.treesitter = {
    ensure_installed = {
        "html",
        "css",
        "markdown",
        "yaml",
        "lua",
        "elixir",
        "surface",
        "heex",
        "eex",
        "bash",
        "comment",
        "tsx",
        "typescript",
        "javascript",
        "json",
        "rust",
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "deno",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "typescript-language-server",
        "yaml-language-server",

        -- elixir
        "elixir-ls",

        -- markdown
        "marksman",

        -- shell
        "shellcheck",

        "rust_analyzer",
        "tsserver",
    },

}

M.nvimtree = {
    ignore_ft_on_setup = { '.git', 'node_modules', '.cache' },
    git = {
        enable = true,
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
    view = {
        side = "right",
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
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
        "rust-analyzer",
    },
}

return M
