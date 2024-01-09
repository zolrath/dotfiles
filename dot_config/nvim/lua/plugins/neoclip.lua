return {
  {
    "AckslD/nvim-neoclip.lua",
    event = "TextYankPost",
    dependencies = { "kkharji/sqlite.lua", module = "sqlite" },
    keys = {
      { "<C-y>", "<cmd>Telescope neoclip<cr>", desc = "Neoclip Telescope" },
    },
    config = function()
      require("neoclip").setup({
        enable_peristent_history = true,
        default_register = "+",
        on_select = {
          move_to_front = true,
        },
        on_paste = {
          move_to_front = true,
        },
      })
      require("telescope").load_extension("neoclip")
    end,
  },
}
