return {
  -- dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
      ██╗  ██╗███████╗ ██████╗██╗  ██╗    ██╗   ██╗███████╗ █████╗ ██╗  ██╗
      ██║  ██║██╔════╝██╔════╝██║ ██╔╝    ╚██╗ ██╔╝██╔════╝██╔══██╗██║  ██║
      ███████║█████╗  ██║     █████╔╝      ╚████╔╝ █████╗  ███████║███████║
      ██╔══██║██╔══╝  ██║     ██╔═██╗       ╚██╔╝  ██╔══╝  ██╔══██║██╔══██║
      ██║  ██║███████╗╚██████╗██║  ██╗       ██║   ███████╗██║  ██║██║  ██║
      ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝       ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },

  -- disable mini.bufremove
  { "echasnovski/mini.bufremove", enabled = false },

  -- use bdelete instead
  {
    "famiu/bufdelete.nvim",
    -- stylua: ignore
    config = function()
      -- switches to Alpha dashboard when last buffer is closed
      local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = "BDeletePost*",
        group = alpha_on_empty,
        callback = function(event)
          local fallback_name = vim.api.nvim_buf_get_name(event.buf)
          local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
          local fallback_on_empty = fallback_name == "" and fallback_ft == ""
          if fallback_on_empty then
            require("neo-tree").close_all()
            vim.cmd("Alpha")
            vim.cmd(event.buf .. "bwipeout")
          end
        end,
      })
    end,
    keys = {
      { "<leader>bd", "<CMD>Bdelete<CR>", desc = "Delete Buffer" },
      { "<leader>bD", "<CMD>Bdelete!<CR>", desc = "Delete Buffer (Force)" },
    },
  },
}
