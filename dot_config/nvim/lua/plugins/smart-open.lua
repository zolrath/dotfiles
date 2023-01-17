return {
  {
    "danielfalk/smart-open.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    lazy = false,
    config = function()
      require("telescope").load_extension("smart_open")
    end,
  },
}
