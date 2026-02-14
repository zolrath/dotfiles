require("config.lazy")

if vim.g.vscode then
  require("config.vscode")
  require("vscode-extensions")
end
