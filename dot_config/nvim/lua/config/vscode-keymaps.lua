require("config.vscode")

if vim.g.vscode then
  -- Remove git command
  vim.keymap.del("n", "<leader>gg")
  vim.keymap.del("n", "<leader>gG")
  vim.keymap.del("n", "<leader>gf")
  vim.keymap.del("n", "<leader>gl")
  vim.keymap.del("n", "<leader>gL")
  vim.keymap.del("n", "<leader>bd")

  vim.keymap.set("n", "u", Undo)
  vim.keymap.set("n", "U", Redo)

  -- Leader
  vim.keymap.set({ "n", "x" }, "<leader>ff", OpenFileBrowserExtension)
  vim.keymap.set({ "n", "x" }, "<leader>b", ShowOpenedEditors)
  vim.keymap.set({ "n", "x" }, "<leader>s", GoToSymbol)
  vim.keymap.set({ "n", "x" }, "<leader>S", ShowAllSymbols)
  vim.keymap.set({ "n", "x" }, "<leader>d", OpenDiagnosticView)
  vim.keymap.set({ "n", "x" }, "<leader>a", QuickFix)
  vim.keymap.set({ "n", "x" }, "<leader>cn", JumpToOutline)
  vim.keymap.set({ "n", "x" }, "<leader>/", QuickSearch)
  vim.keymap.set({ "n", "x" }, "<leader>k", ShowHover)
  vim.keymap.set({ "n", "x" }, "<leader>ca", CodeActions)
  vim.keymap.set({ "n", "x" }, "<leader>cA", SourceActions)
  vim.keymap.set({ "n", "x" }, "<leader>cr", RenameSymbol)
  vim.keymap.set({ "n", "x" }, "<leader>r", Refactor)
  vim.keymap.set({ "n", "x" }, "<leader>?", OpenCommandPalette)
  vim.keymap.set({ "n", "x" }, "<leader>gg", OpenLazyGit)
  vim.keymap.set({ "n", "x" }, "<leader>gG", OpenLazyGit)
  vim.keymap.set({ "n", "x" }, "<leader>bd", CloseActiveEditor)
  vim.keymap.set({ "n", "x" }, "<leader>sg", OpenPeriscope)
  vim.keymap.set({ "n", "x" }, "<leader>fn", CreateNewFile)

  -- Goto
  vim.keymap.set({ "n", "x" }, "gr", GoToReferences)
  vim.keymap.set({ "n", "x" }, "ga", SwitchRecent)
  vim.keymap.set({ "n", "x" }, "g.", GoToLastEditLocation)

  -- Brackets
  vim.keymap.set("n", "[d", GoPrevErrorInFiles)
  vim.keymap.set("n", "]d", GoNextErrorInFiles)

  -- View
  vim.keymap.set("n", "zg", OpenView)

  -- Tmux Like behavior
  vim.keymap.set("n", "<C-a>s", SwitchWindow)
end
