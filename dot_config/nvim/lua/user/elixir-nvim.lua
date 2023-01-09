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
		enableTestLenses = false,
		suggestSpecs = false,
	}),

	on_attach = function(client, bufnr)
		local map_opts = { buffer = true, noremap = true }

		-- run the codelens under the cursor
		vim.keymap.set("n", "<leader>r", vim.lsp.codelens.run, map_opts)
		-- remove the pipe operator
		vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", map_opts)
		-- add the pipe operator
		vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", map_opts)
		vim.keymap.set("v", "<leader>lem", ":ElixirExpandMacro<cr>", map_opts)
		-- update capabilities for nvim-cmp: https://github.com/hrsh7th/nvim-cmp
		-- require("cmp_nvim_lsp").default_capabilities(capabilities)
	end,
})
