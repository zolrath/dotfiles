vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
  end,
})

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "marksman", "yamlls", "elixirls", "cssls", "clangd", "tsserver", "java_language_server", "kotlin_language_server", "svelte", "rust_analyzer", "emmet_ls", "pyright", "vuels", "jsonls"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Set up Elixir CMD
local elixirls_path = vim.fn.expand('$HOME/tools/elixir-ls/language_server.sh')
lspconfig["elixirls"].setup {
    cmd = { elixirls_path };
}
