defmodule Issues.CLI do
  @default_count 4

  @moduledoc """
  Handle command line parsing and dispatch to various funcs that
  end up generating a table of the last _n_ issues in a github project
  """

  def run(argv) do
    parse_args(argv)
  end


  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h: :help      ])
    case parse do
      { [ help: true], _, _ } -> :help
      { _, [ user, project, count ], _ } -> { user, project, String.to_integer(count) }
      { _, [ user, project ], _ } -> { user, project, @default_count }
      _ -> :help
    end
  end

  def parse_args_new(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h: :help      ])
    IO.inspect(parse, label: "PARSE")
  end
end
