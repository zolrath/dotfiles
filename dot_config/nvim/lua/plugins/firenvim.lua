return {
  {
    "glacambre/firenvim",
    lazy = false,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      local elixirSites = { ".*exercism\\.org/tracks/elixir/.*" }
      local rustSites = { ".*exercism\\.org/tracks/rust/.*" }
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
              set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h18
              set noruler noshowcmd
              set laststatus=0 showtabline=0 signcolumn=no

              set spell
              set textwidth=0
              set wrap

              let s:fontsize = 18
              function! AdjustFontSizeF(amount)
              let s:fontsize = s:fontsize+a:amount
              execute "set guifont=JetBrainsMono\\ Nerd\\ Font\\ Mono:h" . s:fontsize
              call rpcnotify(0, 'Gui', 'WindowMaximized', 1)
              endfunction

              noremap  <C-=> :call AdjustFontSizeF(1)<CR>
              noremap  <C--> :call AdjustFontSizeF(-1)<CR>
              inoremap <C-=> :call AdjustFontSizeF(1)<CR>
              inoremap <C--> :call AdjustFontSizeF(-1)<CR>

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
