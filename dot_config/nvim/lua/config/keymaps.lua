-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Don't move cursor when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Rebind 'j' to 'gj' in normal mode
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })

-- Rebind 'k' to 'gk' in normal mode
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- Better 'o' in visual mode
vim.keymap.set("x", "o", "ozz")

if not vim.g.vscode then
  -- Center screen when moving fast
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
end

-- Rebind redo to a logical inverse of u
vim.keymap.set("n", "U", "<C-r>")

-- Allow pasting in middle of a line, even if you yanked a full line.
vim.keymap.set("n", "gP", "i<CR><Esc>PkJxJx", { noremap = true, silent = true })
vim.keymap.set("n", "gp", "i<CR><Esc>PkJxJx", { noremap = true, silent = true })

-- replace word under cursor, hit . to repeat to next instance, n to skip
vim.keymap.set("n", "cg*", "*Ncgn")

-- Use ; for : since we always : and never ;
-- vim.keymap.set("n", ";", ":")

-- insert line from middle of line while in insert mode
vim.keymap.set("i", "<S-CR>", "<esc>o")

-- expand current abbreviation with emmet
vim.keymap.set("i", "<C-d>", "<Plug>(emmet-expand-abbr)")

-- Scroll screen up (but not cursor)
-- C-e for scroll down, C-S-e for up.
vim.keymap.set("n", "<C-S-e>", "<C-y>", { desc = "Scroll screen up" })

-- Add ; or , to the end of a line
vim.keymap.set("n", "<leader>;", [[mmA;<Esc>`m]], { desc = "Add semicolon to end of line" })

vim.keymap.set("v", "<leader>;", ":s/\\([^;]\\)$/\\1;/<CR>", {
  desc = "Add a semicolon to end of each line in visual selection excluding lines that already have semicolons",
})

vim.keymap.set("n", "<leader>,", [[mmA,<Esc>`m]], { desc = "Add comma to end of line" })

vim.keymap.set("v", "<leader>,", ":s/\\([^,]\\)$/\\1,/<CR>", {
  desc = "Add a comma to end of each line in visual selection excluding lines that already have commas",
})

if vim.g.vscode then
  require("config.vscode-keymaps")
end
