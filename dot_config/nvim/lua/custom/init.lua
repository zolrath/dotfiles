require "custom.commands"
require "custom.autocmds"

local opt = vim.opt

opt.cmdheight = 0
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.permanent_undo = true
opt.clipboard = "unnamedplus"
