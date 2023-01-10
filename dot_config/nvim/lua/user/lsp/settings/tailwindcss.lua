return {
    filetypes =
    { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "ejs", "erb",
        "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown",
        "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss",
        "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact",
        "vue", "svelte", "elixir", "surface" },

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
            experimental = {
                classRegex = {
                    [[class= "([^"]*)]],
                    [[class: "([^"]*)]],
                    '~H""".*class="([^"]*)".*"""',
                },
            },
            validate = true,
        },
    },
}
