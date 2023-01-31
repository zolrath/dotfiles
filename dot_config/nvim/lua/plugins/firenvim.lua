return {
  {
    "Sup3Legacy/fontsize.nvim",
    event = "BufReadPost",
    init = function()
      require("fontsize").init({
        font = "JetBrainsMono Nerd Font Mono",
        min = 10,
        default = 14,
        max = 32,
        step = 2,
      })
    end,
    keys = {
      {
        "<Leader>uz",
        "<cmd>FontIncrease<CR>",
        desc = "Increase font size",
      },
      {
        "<Leader>uZ",
        "<cmd>FontDecrease<CR>",
        desc = "Decrease font size",
      },
    },
  },
  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    cond = not not vim.g.started_by_firenvim,
    config = function()
      local elixirSites = { ".*exercism\\.org/tracks/elixir/.*" }
      local rustSites = { ".*exercism\\.org/tracks/rust/.*", ".*leetcode.com/*" }
      local ignoreSites = { "localhost", ".*livebook\\.fly\\.dev.*" }

      local localSettings = {
        [".*"] = {
          cmdline = "neovim",
          priority = 0,
          selector = "textarea",
          takeover = "never",
        },
      }

      for _, site in pairs(elixirSites) do
        localSettings[site] = {
          cmdline = "neovim",
          content = "elixir",
          priority = 1,
          selector = "textarea",
          takeover = "always",
          filename = "{hostname%32}_{pathname%32}_{selector%32}_{timestamp%32}.ex",
        }
      end

      for _, site in pairs(rustSites) do
        localSettings[site] = {
          cmdline = "neovim",
          content = "rust",
          priority = 1,
          selector = "textarea",
          takeover = "always",
          filename = "{hostname%32}_{pathname%32}_{selector%32}_{timestamp%32}.rs",
        }
      end

      for _, site in pairs(ignoreSites) do
        localSettings[site] = {
          priority = 2,
          takeover = "never",
        }
      end

      vim.g.firenvim_config = {
        localSettings = localSettings,
      }

      vim.api.nvim_exec(
        [[
          function! OnUIEnter(event) abort
            if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
              set noruler noshowcmd
              set laststatus=0 showtabline=0 signcolumn=no

              set spell
              set textwidth=0
              set wrap

              autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
              autocmd FocusLost * ++nested write
              autocmd InsertLeave * ++nested write
            endif
          endfunction
        ]],
        false
      )
    end,
  },
}
