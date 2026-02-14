local cm_media_style = {
  { nil, '"""\n\t$1"""', { no_results = true, type = { "class", "func" } } },
  { nil, '"""\n\t$1', { no_results = true, type = { "file" } } },
  { nil, "", { no_results = true, type = { "file" } } },
  { nil, "$1", { no_results = true, type = { "file" } } },
  { nil, '"""', { no_results = true, type = { "file" } } },
  { nil, "", { no_results = true, type = { "file" } } },

  { nil, "# $1", { no_results = true, type = { "type" } } },

  { nil, '"""\n\t$1' },
  { nil, "" },
  {
    "parameters",
    ":param %s: $1",
    { type = { "func" } },
  },
  {
    { "parameters", "type" },
    ":param %s: $1",
    {
      required = "tparam",
      type = { "func" },
    },
  },
  { "attributes", ":param %s: $1" },
  { "throw_statement", ":raises %s: $1", { type = { "func" } } },
  { "return_statement", ":return: $1", { type = { "func" } } },
  { "return_type_hint", ":return: $1", { type = { "func" } } },
  { nil, '"""' },
}

return {
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      {
        "<leader>cg",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
    opts = function(_, opts)
      opts.languages = {
        python = {
          template = {
            annotation_convention = "cm_media_style",
            cm_media_style = cm_media_style,
          },
        },
      }

      if opts.snippet_engine ~= nil then
        return
      end

      local map = {
        ["LuaSnip"] = "luasnip",
        ["nvim-snippy"] = "snippy",
        ["vim-vsnip"] = "vsnip",
      }

      for plugin, engine in pairs(map) do
        if LazyVim.has(plugin) then
          opts.snippet_engine = engine
          return
        end
      end

      if vim.snippet then
        opts.snippet_engine = "nvim"
      end
    end,
  },
}
