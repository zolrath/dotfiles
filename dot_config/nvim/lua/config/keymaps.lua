-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Center screen when moving fast
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", [[<Cmd>lua vim.cmd('normal! n'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]])

vim.keymap.set("n", "N", [[<Cmd>lua vim.cmd('normal! n'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]])

vim.keymap.set(
  "n",
  "<C-d>",
  [[<Cmd>lua vim.cmd('normal! <C-d>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)

vim.keymap.set(
  "n",
  "<C-u>",
  [[<Cmd>lua vim.cmd('normal! <C-u>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)

vim.keymap.set(
  "n",
  "<C-f>",
  [[<Cmd>lua vim.cmd('normal! <C-f>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)

vim.keymap.set(
  "n",
  "<C-b>",
  [[<Cmd>lua vim.cmd('normal! <C-b>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)

-- Rebind redo to a logical inverse of u
vim.keymap.set("n", "U", "<C-r>")

-- Allow pasting in middle of a line, even if you yanked a full line.
vim.keymap.set("n", "gP", "i<CR><Esc>PkJxJx")
vim.keymap.set("n", "gp", "i<CR><Esc>PkJxJx")

-- replace word under cursor, hit . to repeat to next instance, n to skip
vim.keymap.set("n", "cg*", "*Ncgn")

vim.keymap.set("n", ";", ":")

-- insert line from middle of line
vim.keymap.set("i", "<S-CR>", "<esc>o")

-- expand current abbreviation with emmet
vim.keymap.set("i", "<C-d>", "<Plug>(emmet-expand-abbr)")

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
