local elixirSites = {".*exercism\\.org.*"}
local ignoreSites = {"localhost", ".*furd-livebook\\.fly\\.dev.*"}

local localSettings = {
    [".*"] = {
        cmdline = "neovim",
        content = "elixir",
        priority = 0,
        selector = "textarea",
        takeover = "always",
    }
}

for _, site in pairs(elixirSites) do
    localSettings[site] = {
        cmdline = "neovim",
        content = "elixir",
        priority = 1,
        selector = "textarea",
        takeover = "always",
        filename = '{hostname%32}_{pathname%32}_{selector%32}_{timestamp%32}.ex'
    }
end

for _, site in pairs(ignoreSites) do
    localSettings[site] = {
        priority = 2,
        takeover = "never",
    }
end

vim.g.firenvim_config = {
    localSettings = localSettings
}

vim.api.nvim_exec([[
function! OnUIEnter(event) abort

if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
    set guifont=JetBrainsMono\ NF:h12
    let s:fontsize = 12
    function! AdjustFontSizeF(amount)
      let s:fontsize = s:fontsize+a:amount
      execute "set guifont=JetBrainsMono\\ NF:h" . s:fontsize
      call rpcnotify(0, 'Gui', 'WindowMaximized', 1)
    endfunction

    noremap  <C-=> :call AdjustFontSizeF(1)<CR>
    noremap  <C--> :call AdjustFontSizeF(-1)<CR>
    inoremap <C-=> :call AdjustFontSizeF(1)<CR>
    inoremap <C--> :call AdjustFontSizeF(-1)<CR>
endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
]], false)
