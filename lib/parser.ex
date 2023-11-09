defmodule Parser do

  @spec execute(
    {:print
      | :add
      | :rem
      | :unknown, any, any}
  ) :: any

  def execute({:print, _line, figures_list}) do
    case figures_list do
      [] -> IO.puts("[I] List is empty")
      _ -> Commands.print_impl(figures_list)
    end
    IO.puts("-------------------")
    figures_list
  end

  def execute({:add, line, figures_list}) do
    try do
      figures_list ++ case line |> String.split(~r/ /, trim: true) |> Enum.drop(1) do
        ["circle", x, y, r, color, date] -> Geometrys.createCircle(x, y, r, color, date)
        ["rectangle", x1, y1, x2, y2, color, date] -> Geometrys.createRectangle(x1, y1, x2, y2, color, date)
        ["triangle", x1, y1, x2, y2, x3, y3, color, date] -> Geometrys.createTriangle(x1, y1, x2, y2, x3, y3, color, date)
        parts -> IO.puts "[E] Wrong args for add command: #{inspect(parts)}"; []
      end
    rescue
      e -> IO.puts "[E] Wrong command add: #{Exception.message(e)}"; figures_list
    end
  end

  def execute({:rem, line, figures_list}) do
    case line |> String.split(~r/ /, trim: true) |> Enum.drop(1) do
      [type, color] ->
        Commands.rem_check_two_args(figures_list, type, color)
      ["circle", x, y, r] ->
        Commands.delete_spec_circle(figures_list, x, y, r)
      ["rectangle", x1, y1, x2, y2] ->
        Commands.delete_spec_rectangle(figures_list, x1, y1, x2, y2)
      ["triangle", x1, y1, x2, y2, x3, y3] ->
        Commands.delete_spec_triangle(figures_list, x1, y1, x2, y2, x3, y3)
      [type] ->
        Commands.rem_check_one_args(figures_list, type)
      parts ->
        IO.puts "[E] Wrong command remove: #{inspect(parts)}"; figures_list
    end
  end

  def execute({:unknown, line, figures_list}) do
    IO.puts "[W] Undefinded command: #{line}"
    figures_list
  end
end
