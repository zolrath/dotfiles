return {
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            scrollbar = "║",
          },
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            scrollbar = "║",
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        sorting = {
          comparators = {
            -- order matters here
            cmp.config.compare.exact,
            --deprioritize_snippet,
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        preselect = cmp.PreselectMode.Item,
        formatting = {
          format = function(_, item)
            -- set icons
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            -- set width to a constant size
            local ELLIPSIS_CHAR = "…"
            local MAX_LABEL_WIDTH = 20
            local MIN_LABEL_WIDTH = 20

            local label = item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
            if truncated_label ~= label then
              item.abbr = truncated_label .. ELLIPSIS_CHAR
            elseif string.len(label) < MIN_LABEL_WIDTH then
              local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
              item.abbr = label .. padding
            end

            local MAX_MENU_WIDTH = 20
            local MIN_MENU_WIDTH = 20

            local menu = item.menu
            local truncated_menu = vim.fn.strcharpart(menu, 0, MAX_MENU_WIDTH)
            if truncated_menu ~= menu then
              item.menu = truncated_menu .. ELLIPSIS_CHAR
            elseif string.len(menu) < MIN_MENU_WIDTH then
              local padding = string.rep(" ", MIN_MENU_WIDTH - string.len(menu))
              item.menu = menu .. padding
            end

            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
}
