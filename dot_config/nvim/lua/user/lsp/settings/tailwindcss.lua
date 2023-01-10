local lspconfig = require("lspconfig")
local util = require("lspconfig").util

-- local function root_pattern(...)
--   local patterns = vim.tbl_flatten({ ... })
--
--   return function(startpath)
--     for _, pattern in ipairs(patterns) do
--       return lspconfig.util.search_ancestors(startpath, function(path)
--         if lspconfig.util.path.exists(vim.fn.glob(lspconfig.util.path.join(path, pattern))) then return path end
--       end)
--     end
--   end
-- end
--
return {
    filetypes =
    { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "ejs", "erb",
        "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown",
        "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss",
        "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact",
        "vue", "svelte", "elixir", "surface" },


    root_dir = util.root_pattern(
      "./assets/tailwind.config.js",
      "./assets/tailwind.config.ts",
      "tailwind.config.js",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.ts",
      "package.json",
      "node_modules",
      ".git"
    ),

    init_options = {
        userLanguages = {
            elixir = "phoenix-heex",
            eruby = "erb",
            heex = "phoenix-heex",
            svelte = "html",
            surface = "phoenix-heex"
        },
    },
    handlers = {
        ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
        end,
    },
    settings = {
        includeLanguages = {
            typescript = "javascript",
            typescriptreact = "html",
            ["html-eex"] = "html",
            ["phoenix-heex"] = "html",
            heex = "html",
            eelixir = "html",
            elixir = "html",
            elm = "html",
            erb = "html",
            svelte = "html",
            surface = "html"
        },
        tailwindCSS = {
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
            },
            classAttributes = {
              'class',
              'className',
              'classList',
              'ngClass',
            },
            experimental = {
                classRegex = {
                    [[class= "([^"]*)]],
                    [[class: "([^"]*)]],
                    '~H""".*class="([^"]*)".*"""',
                    '~L""".*class="([^"]*)".*"""',
                },
            },
            validate = true,
        },
    },
}
