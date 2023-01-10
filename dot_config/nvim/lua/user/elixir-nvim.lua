local elixir = require("elixir")

local elixirls_path = vim.fn.expand("$HOME/tools/elixir-ls/language_server.sh")
elixir.setup({
	-- alternatively, point to an existing elixir-ls installation (optional)
	-- not currently supported by elixirls, but can be a table if you wish to pass other args `{"path/to/elixirls", "--foo"}`
	cmd = elixirls_path,

	-- default settings, use the `settings` function to override settings
	settings = elixir.settings({
		dialyzerEnabled = false,
		fetchDeps = false,
		enableTestLenses = true,
		suggestSpecs = false,
	}),

	on_attach = function(client, bufnr)
		local opts = { buffer = true, noremap = true, silent = true }
		-- run the codelens under the cursor
		vim.api.nvim_buf_set_keymap(bufnr, "n",  "<leader>r", vim.lsp.codelens.run, opts)
		-- remove the pipe operator
		vim.api.nvim_buf_set_keymap(bufnr, "n",  "<leader>efp", ":ElixirFromPipe<cr>", opts)
		-- add the pipe operator
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>etp", ":ElixirToPipe<cr>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n",  "<leader>lem", ":ElixirExpandMacro<cr>", opts)

		-- update capabilities for nvim-cmp: https://github.com/hrsh7th/nvim-cmp
		-- require("cmp_nvim_lsp").default_capabilities(capabilities)
	end,
})
