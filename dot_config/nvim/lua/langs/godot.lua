return {
  {
    "habamax/vim-godot",
    keys = {
      {
        "<Leader>grc",
        "<cmd>:GodotRunCurrent<CR>",
        desc = "Godot Run Current Scene",
      },
      {
        "<Leader>grl",
        "<cmd>:GodotRunLast<CR>",
        desc = "Godot Run Last Scene",
      },
      {
        "<Leader>grr",
        "<cmd>:GodotRunFZF<CR>",
        desc = "Godot Run Search Scene",
      },
    },
  },
}
