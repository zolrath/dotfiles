return {
  {
    "rareitems/put_at_end.nvim",
    event = "BufEnter",
    keys = function()
      local p = require("put_at_end")
      return {
        { "<leader>;", p.put_semicolon, desc = "Put semicolon at EOL" },
        { "<leader>,", p.put_period, desc = "Put comma at EOL" },
      }
    end,
  },
}
