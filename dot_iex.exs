import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

defmodule :_exit do
  defdelegate exit(), to: System, as: :halt
end

import :_exit

defmodule Utils do
  def module_compiled?(module) do
    function_exported?(module, :__info__, 1)
  end
end

defmodule DB do
  if Utils.module_compiled?(Ecto.Changeset) do
    def update(schema, changes) do
      schema
      |> Ecto.Changeset.change(changes)
      |> Repo.update()
    end
  end
end

IEx.configure(
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: [:light_blue],
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ],
  default_prompt:
  [
    # ANSI CHA, move cursor to column 1
    "\e[G",
    :light_magenta,
    # plain string
    "🧪 iex",
    ">",
    :white,
    :reset
  ]
  |> IO.ANSI.format()
  |> IO.chardata_to_string()
)
