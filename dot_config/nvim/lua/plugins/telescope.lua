local builtin = require("telescope.builtin")

return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      -- Enhanced version of "/" search command
      { "<leader>/", builtin.current_buffer_fuzzy_find, desc = "Fuzzy search in buffer" },
      { "<leader>s/", builtin.search_history, desc = "Search history" },

      -- Enhanced version of "*"
      { "<leader>*", builtin.grep_string, desc = "Search word under cursor" },

      { "<leader>sb", builtin.buffers, desc = "Buffers" },
      { "<leader>so", builtin.oldfiles, desc = "Old files" },
      { "<leader>sf", builtin.find_files, desc = "Files" },
      -- { "<leader>sF", "<Cmd>Telescope file_browser<CR>", desc = "Browse files" },

      -- By starting grep_string with empty search key, we fuzzy over everything
      { "<leader>st", "<cmd>Telescope grep_string search= theme=ivy <CR>", desc = "Fuzzy search workspace" },

      -- sH, sM to search help and manpage would be more "consistent", but I search help more often than highlight, so lowercase is reserved for that
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sM", builtin.man_pages, desc = "[M]an Page" },

      -- Since ; and : is the same button to start command
      { "<leader>s;", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sc", builtin.command_history, desc = "Command history" },

      -- since register start with tick already
      { "<leader>s'", builtin.registers, desc = "Registers" },
      { "<leader>sj", builtin.jumplist, desc = "Jumplist" },
      { "<leader>sp", builtin.builtin, desc = "Pickers" },

      { "<leader>sO", builtin.vim_options, desc = "Vim options" },
      --{ "<leader>s<Tab>", "<Cmd>Telescope telescope-tabs list_tabs<CR>", desc = "Tabs" },
    },
  },
}
