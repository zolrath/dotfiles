-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
--   config = config or {}
--   config.focus_id = ctx.method
--   config.border = "rounded"
--   if not (result and result.contents) then
--     return
--   end
--   local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
--   markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
--   if vim.tbl_isempty(markdown_lines) then
--     return
--   end
--   return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
-- end

vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  close_events = { "BufHidden", "InsertLeave" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
