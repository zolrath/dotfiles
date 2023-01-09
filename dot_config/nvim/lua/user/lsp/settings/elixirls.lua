local elixirls_path = vim.fn.expand("$HOME/tools/elixir-ls/language_server.sh")

return {
	setup = {
		cmd = { elixirls_path },
	},
}
