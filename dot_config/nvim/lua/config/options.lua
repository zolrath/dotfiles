-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.o.relativenumber = true

-- pylance is closed source - basedbyright brings pylance features into pyright
-- I'm mostly interested in the auto import features
vim.g.lazyvim_python_lsp = "basedpyright"

-- Set paste directly - greatly improves startup time
-- vim.opt.clipboard = ""
-- vim.g.clipboard = {
--   copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
--   paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
--   cache_enabled = true,
-- }
