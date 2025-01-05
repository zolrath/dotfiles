return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    styles = {
      zen = {
        backdrop = { transparent = false, blend = 70 },
      },
    },
    zen = {
      toggles = {
        dim = true,
        git_signs = false,
        mini_diff_signs = false,
        diagnostics = false,
        inlay_hints = false,
      },
    },
  },
}
