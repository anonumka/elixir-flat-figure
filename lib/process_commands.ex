defmodule Process_Commands do
  @moduledoc """
  Read lines from specified file
  """

  @cmdtypes [
    {~r/add.*/, :add},
    {~r/rem.*/, :rem},
    {~r/print/, :print}
  ]

  def processLines(lines) do
    processLines(lines, [])
  end

  defp processLines(lines, figures_list) do
    case lines do
      [] -> :ok
      _ ->
        [head | tail] = lines
        figures_list = parse(head, figures_list) |> Parser.execute
        processLines(tail, figures_list);
    end
  end

  defp parse(line, lists) do
    {_, type} =
      Enum.find(@cmdtypes, {nil, :unknown}, fn {regex, _} ->
          String.match?(line, regex)
        end)
    {type, line, lists}
  end
end
