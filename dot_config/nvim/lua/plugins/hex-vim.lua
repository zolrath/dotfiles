return {
  "mattn/webapi-vim",
  {
    "lucidstack/hex.vim",
    event = "BufEnter mix.exs",
    dependencies = { "mattn/webapi-vim" },
  },
}
