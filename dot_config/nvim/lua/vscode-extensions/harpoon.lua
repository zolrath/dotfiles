local vscode = require("vscode")

function HarpoonAdd()
  vscode.call("vscode-harpoon.addEditor")
end
function HarpoonList()
  vscode.call("vscode-harpoon.editorQuickPick")
end
function HarpoonEdit()
  vscode.call("vscode-harpoon.editEditors")
end
function HarpoonJump(editorNumber)
  return function()
    vscode.call("vscode-harpoon.gotoEditor" .. editorNumber)
  end
end

-- Keymaps
vim.keymap.set({ "n", "x" }, "<leader>ha", HarpoonAdd)
vim.keymap.set({ "n", "x" }, "<leader>hh", HarpoonList)
vim.keymap.set({ "n", "x" }, "<leader>he", HarpoonEdit)
vim.keymap.set({ "n", "x" }, "<leader>1", HarpoonJump(1))
vim.keymap.set({ "n", "x" }, "<leader>2", HarpoonJump(2))
vim.keymap.set({ "n", "x" }, "<leader>3", HarpoonJump(3))
vim.keymap.set({ "n", "x" }, "<leader>4", HarpoonJump(4))
vim.keymap.set({ "n", "x" }, "<leader>5", HarpoonJump(5))
