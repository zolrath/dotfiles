return {
  -- Add Smart Open
  {
    "danielfalk/smart-open.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    keys = {
      { "<leader><space>", "<cmd>Telescope smart_open<cr>", desc = "Smart open" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VimEnter",
    keys = {
      {
        "<leader>gb",
        function()
          local actions = require("telescope.actions")
          require("telescope.builtin").git_branches({
            attach_mappings = function(prompt_bufnr, map)
              map("i", "<c-d>", actions.git_delete_branch)
              map("n", "<c-d>", actions.git_delete_branch)
              return true
            end,
          })
        end,
        desc = "Find Git Branches",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({ hidden = false })
        end,
        desc = "Find Grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers({})
        end,
        desc = "Find Buffers",
      },
      {
        "<leader>gs",
        function()
          require("telescope.builtin").git_status({})
        end,
        desc = "Find Git Status",
      },
      {
        "<leader>gl",
        function()
          require("telescope.builtin").git_commits({})
        end,
        desc = "Find Git Log",
      },
      {
        "<leader>f/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find({})
        end,
        desc = "Find In File",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--column",
            "--hidden",
            "--line-number",
            "--no-heading",
            "--smart-case",
            "--with-filename",
          },
          prompt_prefix = " ❯ ",
          selection_caret = "❯ ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = { mirror = false },
            vertical = { mirror = false },
            prompt_position = "bottom",
            width = 0.8,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<esc>"] = function(...)
                return require("telescope.actions").close(...)
              end,
            },
          },
          path_display = { "absolute" },
          -- file_sorter = require("telescope.sorters").get_fzy_sorter,
          file_ignore_patterns = { "^.git/" },
          -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          use_less = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        },
      })
      telescope.load_extension("fzf")
    end,
  },
}
