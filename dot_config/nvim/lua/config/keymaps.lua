-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "cg*", "*Ncgn")

vim.keymap.set("n", ";", ":")

-- local readline = require("readline")
-- vim.keymap.set("!", "<C-k>", readline.kill_line)
-- vim.keymap.set("!", "<C-u>", readline.backward_kill_line)
-- vim.keymap.set("!", "<M-d>", readline.kill_word)
-- vim.keymap.set("!", "<M-BS>", readline.backward_kill_word)
-- vim.keymap.set("!", "<C-w>", readline.unix_word_rubout)
-- vim.keymap.set("!", "<M-f>", readline.forward_word)
-- vim.keymap.set("!", "<M-b>", readline.backward_word)
-- vim.keymap.set("!", "<C-f>", "<Right>") -- forward-char
-- vim.keymap.set("!", "<C-b>", "<Left>") -- backward-char
-- vim.keymap.set("!", "<C-n>", "<Down>") -- next-line
-- vim.keymap.set("!", "<C-p>", "<Up>") -- previous-line
