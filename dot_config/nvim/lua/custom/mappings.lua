local M = {}

M.general = {
  i = {
    -- navigate within insert mode
    ["<C-l>"] = { "<Left>", "move left" },
    ["<C-r>"] = { "<Right>", "move right" },
    ["<C-d>"] = { "<Down>", "move down" },
    ["<C-u>"] = { "<Up>", "move up" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.packer = {
  n = {
    ["<leader>ps"] = { "<cmd>PackerSync<cr>", "Packer Sync" },
    ["<leader>pS"] = { "<cmd>PackerStatus<cr>", "Packer Status" },
    ["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Packer Update" },
  },
}

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<cmd> Telescope<CR>", "open telescope" },
    ["\\\\"] = { "<cmd> Telescope find_files<CR>", "file finder" },
    ["\\f"] = { "<cmd> Telescope live_grep<CR>", "telescope live grep" },
  },
}

M.git = {
   n = {
      ["<leader>lg"] = { "<cmd>LazyGit<CR>", "open lazygit" },
      ["<leader>gc"] = { "<cmd> Telescope git_commits<CR>", "git commits" },
      ["<leader>gs"] = { "<cmd> Telescope git_status<CR>", "git status" },
   },
}

return M
