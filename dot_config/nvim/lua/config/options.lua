-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- use bash for vim shell as supposedly fish is a bit slower in vims context and plugins assume bash.
--vim.opt.shell = "bash"

-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.o.relativenumber = true

-- Set paste directly - greatly improves startup time
-- local is_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
-- local is_osx = vim.loop.os_uname().sysname == "Darwin"

vim.opt.clipboard = ""
-- if is_wsl then
--   -- require("config.paste").setup()
--   vim.g.clipboard = {
--     copy = {
--       ["+"] = "win32yank.exe -i --crlf",
--       ["*"] = "win32yank.exe -i --crlf",
--     },
--     paste = {
--       ["+"] = "win32yank.exe -o --lf",
--       ["*"] = "win32yank.exe -o --lf",
--     },
--     cache_enabled = true,
--   }
-- elseif is_osx then
--   vim.g.clipboard = {
--     copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
--     paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
--     cache_enabled = true,
--   }
-- else
--   vim.g.clipboard = {
--     copy = { ["+"] = "xsel --nodetach -i -b", ["*"] = "xsel --nodetach -i -p" },
--     paste = { ["+"] = "xsel  -o -b", ["*"] = "xsel  -o -b" },
--     cache_enabled = true,
--   }
-- end
