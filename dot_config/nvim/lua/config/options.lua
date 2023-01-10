-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.guifont = "JetBrainsMono Nerd Font:h11"

local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil

if in_wsl then
  vim.g.clipboard = {
    copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
    paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
    cache_enabled = true,
  }
else
  vim.g.clipboard = {
    name = "xsel",
    copy = { ["+"] = "xsel --nodetach -i -b", ["*"] = "xsel --nodetach -i -p" },
    paste = { ["+"] = "xsel  -o -b", ["*"] = "xsel  -o -b" },
    cache_enabled = true,
  }
end
