-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.lua',
--   group = 'AutoFormatting',
--   callback = function()
--     vim.lsp.buf.format({ async = true })
--   end,
-- })

local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
-- opt.guifont = { "JetBrainsMono NF", ":h14" }
