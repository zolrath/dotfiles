local elixirSites = {".*exercism\\.org.*", "localhost"}

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
    }
end

vim.g.firenvim_config = {
    localSettings = localSettings
}
--
-- WriterTimerStarted = false
--
-- function WriteBufferToPage()
--     WriterTimerStarted = false
--     vim.cmd([[write]])
-- end
--
-- function DelayWriteBufferToPage()
--     if WriterTimerStarted then
--         return
--     end
--     WriterTimerStarted = true
--     local timer = vim.loop.new_timer()
--     timer:start(10000, 0, function()
--         vim.cmd([[write]])
--         timer:close()
--     end)
-- end
--
--         vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
--           callback = function(ev)
--             print(string.format('event fired: s', vim.inspect(ev)))
--           end
--         })
--
-- au TextChanged * ++nested call Delay_My_Write()
-- au TextChangedI * ++nested call Delay_My_Write()
