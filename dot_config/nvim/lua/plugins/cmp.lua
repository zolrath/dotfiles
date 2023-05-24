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
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "noselect",
      }
      opts.performance = { debounce = 150 }
      opts.window = {
        completion = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          scrollbar = "║",
        },
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          scrollbar = "║",
        },
      }
      opts.mapping = cmp.mapping.preset.insert({
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item if true.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })
      opts.formatting = {
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
      }
      opts.experimental = {
        ghost_text = {
          hl_group = "LspCodeLens",
        },
      }
    end,
  },
}
