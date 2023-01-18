return {
  {
    "rareitems/put_at_end.nvim",
    event = "BufReadPost",
    keys = {
      {
        "<leader>;",
        function()
          require("put_at_end").put_semicolon()
        end,
        desc = "Put semicolon at EOL",
      },
      {
        "<leader>,",
        function()
          require("put_at_end").put_period()
        end,
        desc = "Put comma at EOL",
      },
    },
  },
}
