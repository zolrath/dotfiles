vim.g.projectionist_heuristics = vim.json.decode([[
{
  "Cargo.toml": {
    "src/*.rs": { "type": "source" },
    "tests/*.rs": { "type": "test" },
    "benchmarks/*.rs": { "type": "benchmarks" },
    "Cargo.toml": { "type": "config" }
  },
  "package.json": {
    "*.js": { "type": "source", "make": "yarn" },
    "*.ts": { "type": "source", "make": "yarn" },
    "package.json": { "type": "config" }
  },
  "mix.exs": {
    "apps/*/mix.ex": { "type": "app" },
    "mix.exs": { "type": "mix" },
    "config/*.exs": { "type": "config" },
    "lib/**/live/*_live.ex": {
      "type": "live",
      "alternate": "test/{dirname}/live/{basename}_live_test.exs",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live do",
        "  use {dirname|camelcase|capitalize}, :live_view",
        "end"
      ]
    },
    "test/**/live/*_live_test.exs": {
      "alternate": "lib/{dirname}/live/{basename}_live.ex",
      "type": "test",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}LiveTest do",
        "  use ExUnit.Case, async: true",
        "",
        "  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live",
        "end"
      ]
    },
    "*eex": {
      "type": "template",
      "related": [
        "{dirname}/controllers/{dirname|basename}_controller.ex",
        "{dirname}/live/{dirname|basename}_live.ex",
        "{dirname}/views/{dirname|basename}_view.ex"
      ],
      "template": [
        "<%# {basename} heex template %>"
      ]
    },
    "lib/**/views/*_view.ex": {
      "type": "view",
      "alternate": "test/{dirname}/views/{basename}_view_test.exs",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}View do",
        "  use {dirname|camelcase|capitalize}, :view",
        "end"
      ]
    },
    "test/**/views/*_view_test.exs": {
      "alternate": "lib/{dirname}/views/{basename}_view.ex",
      "type": "test",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ViewTest do",
        "  use ExUnit.Case, async: true",
        "",
        "  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}View",
        "end"
      ]
    },
    "lib/**/controllers/*_controller.ex": {
      "type": "controller",
      "alternate": "test/{dirname}/controllers/{basename}_controller_test.exs",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Controller do",
        "  use {dirname|camelcase|capitalize}, :controller",
        "end"
      ]
    },
    "test/**/controllers/*_controller_test.exs": {
      "alternate": "lib/{dirname}/controllers/{basename}_controller.ex",
      "type": "test",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ControllerTest do",
        "  use {dirname|camelcase|capitalize}.ConnCase, async: true",
        "end"
      ]
    },
    "lib/**/channels/*_channel.ex": {
      "type": "channel",
      "alternate": "test/{dirname}/channels/{basename}_channel_test.exs",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel do",
        "  use {dirname|camelcase|capitalize}, :channel",
        "end"
      ]
    },
    "test/**/channels/*_channel_test.exs": {
      "alternate": "lib/{dirname}/channels/{basename}_channel.ex",
      "type": "test",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ChannelTest do",
        "  use {dirname|camelcase|capitalize}.ChannelCase, async: true",
        "",
        "  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel",
        "end"
      ]
    },
    "test/**/features/*_test.exs": {
      "type": "feature",
      "template": [
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Test do",
        "  use {dirname|camelcase|capitalize}.FeatureCase, async: true",
        "end"
      ]
    },
    "lib/*.ex": {
      "alternate": "test/{}_test.exs",
      "type": "source",
      "template": [
        "defmodule {camelcase|capitalize|dot} do",
        "end"
      ]
    },
    "test/*_test.exs": {
      "alternate": "lib/{}.ex",
      "type": "test",
      "template": [
        "defmodule {camelcase|capitalize|dot}Test do",
        "  use ExUnit.Case, async: true",
        "",
        "  alias {camelcase|capitalize|dot}",
        "",
        "  doctest {camelcase|capitalize|dot}",
        "end"
      ]
    }
  }
}
]])
