defmodule Eff do
  @moduledoc """
  Documentation for `Eff`.
  """

  @doc """
  Main function which run a app
  """
  def run do
    input_file = "input.txt"
    input_file |> file_to_strings |> Process_Commands.processLines
  end

  defp file_to_strings(file) do
    case File.read(file) do
      {:ok, contents} -> contents |> String.downcase() |> String.split("\n", trim: true) |> Enum.map(&String.trim/1) |> Enum.filter(fn x -> x != "" end)
      {:error, reason} ->
        IO.puts "[E] Failed read file: #{reason}"
        []
    end
  end
end
