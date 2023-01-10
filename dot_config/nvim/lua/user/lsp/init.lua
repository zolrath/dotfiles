local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

local status_ok1, fidget = pcall(require, "fidget")
if not status_ok1 then
	return
end

-- local banned_messages = { "No information available" }
-- vim.notify = function(msg, ...)
--   for _, banned in ipairs(banned_messages) do
--     if msg == banned then
--       return
--     end
--   end
--   require("notify")(msg, ...)
-- end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
fidget.setup({})
require("user.lsp.clangd")

