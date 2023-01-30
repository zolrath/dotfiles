-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-float",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "gitcommit",
  },
  command = "startinsert",
  group = vim.api.nvim_create_augroup("AutoInsert", { clear = true }),
})

-- ensure the parent folder exists, so it gets properly added to the lsp
-- context and everything just works.
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
      vim.cmd([[ :e % ]])
    end
  end,
  group = vim.api.nvim_create_augroup("Mkdir", { clear = true }),
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.livemd" },
  callback = function()
    vim.cmd("set filetype=markdown")
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.sh.tmpl" },
  callback = function()
    vim.cmd("set filetype=sh")
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "*.conf",
  callback = function()
    vim.cmd("set ft=conf")
  end,
})
