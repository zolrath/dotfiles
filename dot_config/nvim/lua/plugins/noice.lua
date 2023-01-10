return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    }
    opts.routes = {
      -- Show "recording" messages
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      -- Hide "written" messages
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      -- Hide "No information available" messages
      {
        view = "notify",
        filter = {
          find = "No information available",
        },
        opts = { skip = true },
      },
    }
  end,
}
