return {
    ["neovim/nvim-lspconfig"] = {
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end,
    },

    ["kdheepak/lazygit.nvim"] = {},
    ['folke/which-key.nvim'] = { disable = false },
    ["glacambre/firenvim"] = {
        run = function () vim.fn['firenvim#install'](0) end,
        config = function()
            require "custom.plugins.firenvim"
        end,
    }
}
