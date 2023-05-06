return {
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "zellij"
      vim.g.slime_default_config = { session_id = "current", relative_pane = "right" }
    end,
  },
}
