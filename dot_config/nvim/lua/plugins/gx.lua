return {
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    submodules = false,
    config = function()
      require("gx").setup({
        open_browser_app = "os_specific",
        handlers = {
          plugin = true,
          github = true,
          brewfile = true,
          package_json = true,
          search = true,
          go = true,
          rust = {
            name = "rust",
            filetype = { "toml" },
            filename = "Cargo.toml",
            handle = function(mode, line, _)
              local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")
              if crate then
                return "https://crates.io/crates/" .. crate
              end
            end,
          },
        },
        handler_options = {
          search_engine = "https://search.brave.com/search?q=",
          select_for_search = false,
          git_remotes = { "upstream", "origin" },
          git_remote_push = false,
        },
      })
    end,
  },
}
