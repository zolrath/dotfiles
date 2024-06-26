-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "elixir",
  },
  callback = function(_)
    vim.cmd("setlocal indentkeys-=0{")
    vim.cmd("setlocal indentkeys+=0=end")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "eelixir",
  },
  callback = function(_)
    vim.cmd("setlocal indentkeys+=0=end")
  end,
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

-- livemd for Elixir and mdx are both markdown based
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.livemd", "*.mdx" },
  callback = function()
    vim.cmd("set filetype=markdown")
  end,
})

-- chezmoi .sh.tmpl files are templated .sh
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

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "*.astro",
  callback = function()
    vim.cmd("set filetype=astro")
  end,
})

-- fix cadence filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.cdc" },
  callback = function()
    vim.cmd("set filetype=cadence")
  end,
})

-- fix go templ filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.templ" },
  callback = function()
    vim.cmd("set filetype=templ")
  end,
})

--fix odin comment string
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "odin",
  },
  callback = function(_)
    vim.cmd("setlocal commentstring=//%s")
  end,
})

--fix terraform and hcl comment string
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "terraform",
    "hcl",
  },
  callback = function(_)
    vim.cmd("setlocal commentstring=#%s")
  end,
})

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  command = [[call setreg("@", getreg("+"))]],
})

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  command = [[call setreg("+", getreg("@"))]],
})
