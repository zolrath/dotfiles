local function link(group, other)
  vim.cmd("highlight! link " .. group .. " " .. other)
end

local function set_bg(group, bg)
  vim.cmd("hi " .. group .. " guibg=" .. bg)
end

local function set_fg_bg(group, fg, bg)
  vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end

local noice_config = function()
  local spinners = require("noice.util.spinners")
  spinners.spinners["mine"] = {
    frames = {
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
    },
    interval = 80,
  }

  require("noice").setup({
    format = {
      spinner = {
        name = "mine",
        hl = "Constant",
      },
    },
    lsp = {
      progress = {
        enabled = false,
        format = {
          { "{data.progress.percentage} ", hl_group = "Comment" },
          { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "Comment" },
        },
        format_done = {},
      },
      hover = { enabled = true },
      signature = { enabled = false, auto_open = { enabled = false } },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    cmdline = {
      format = {
        filter = { pattern = "^:%s*!", icon = " ", ft = "sh" },
        IncRename = {
          pattern = "^:%s*IncRename%s+",
          icon = " ",
          conceal = true,
          opts = {
            -- relative = "cursor",
            -- size = { min_width = 20 },
            -- position = { row = -3, col = 0 },
            buf_options = { filetype = "text" },
          },
        },
      },
    },
    views = {
      cmdline_popup = {
        win_options = {
          winblend = 5,
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "NoiceCmdlinePopupBorder",
            IncSearch = "",
            Search = "",
          },
          cursorline = false,
        },
      },
    },
    popupmenu = {
      enabled = true,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
        view = "mini",
      },
      {
        filter = { event = "msg_show", min_height = 10 },
        view = "split",
        opts = { enter = true },
      },
      {
        filter = { event = "msg_show", kind = "search_count" },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "; before #",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "; after #",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = " lines, ",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "go up one level",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "yanked",
        },
        opts = { skip = true },
      },
      {
        filter = { find = "No active Snippet" },
        opts = { skip = true },
      },
      {
        filter = { find = "waiting for cargo metadata" },
        opts = { skip = true },
      },
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
    },
  })
end

return {
  {
    "folke/noice.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = function()
      noice_config()
    end,
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward" },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward"},
    },
  },
  -- notify customization
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
      timeout = 2000,
      render = "compact",
    },
  },
}
