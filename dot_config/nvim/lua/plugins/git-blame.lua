return {
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = function()
      Snacks.toggle({
        name = "Git Blame",
        get = function()
          return vim.g.gitblame_enabled
        end,
        set = function(_)
          vim.cmd("GitBlameToggle")
        end,
      }):map("<leader>uy")

      return {
        enabled = false,
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
      }
    end,
  },
}
