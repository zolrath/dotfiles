if true then
  return {}
end

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = false,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot-cmp" },
    opts = function(_, opts)
      local has_copilot, copilot_cmp = pcall(require, "copilot_cmp.comparators")
      local cmp = require("cmp")

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" } }))
      opts.sorting = {
        sorting = {
          --keep priority weight at 2 for much closer matches to appear above copilot
          --set to 1 to make copilot always appear on top
          priority_weight = 2,
          comparators = {
            -- order matters here
            cmp.config.compare.exact,
            --deprioritize_snippet,
            has_copilot and copilot_cmp.prioritize or nil,
            has_copilot and copilot_cmp.score or nil,

            cmp.config.compare.recently_used,
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.score,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      }
    end,
  },
}
