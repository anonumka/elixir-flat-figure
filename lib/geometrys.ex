defmodule Geometrys do
  @doc """
  Create a figures
  """

  def createCircle(x, y, r, color, date) do
    cond do
      Utils.checkColor(color) == false -> IO.puts "[E] Wrong color: #{color}"; []
      Utils.checkDate(date) == false -> IO.puts "[E] Wrong date: #{date}"; []
      true -> create("circle", %{"x" => Utils.toInt(x), "y" => Utils.toInt(y), "r" => Utils.toInt(r), "color" => color, "date" => date})
    end
  end

  def createRectangle(x1, y1, x2, y2, color, date) do
    cond do
      Utils.checkColor(color) == false -> IO.puts "[E] Wrong color: #{color}"; []
      Utils.checkDate(date) == false -> IO.puts "[E] Wrong date: #{date}"; []
      true -> create("rectangle", %{"x1" => Utils.toFloat(x1), "y1" => Utils.toFloat(y1), "x2" => Utils.toFloat(x2), "y2" => Utils.toFloat(y2), "color" => color, "date" => date})
    end
  end

  def createTriangle(x1, y1, x2, y2, x3, y3, color, date) do
    cond do
      Utils.checkColor(color) == false -> IO.puts "[E] Wrong color: #{color}"; []
      Utils.checkDate(date) == false -> IO.puts "[E] Wrong date: #{date}"; []
      true -> create("triangle", %{"x1" => Utils.toFloat(x1), "y1" => Utils.toFloat(y1), "x2" => Utils.toFloat(x2), "y2" => Utils.toFloat(y2), "x3" => Utils.toFloat(x3), "y3" => Utils.toFloat(y3), "color" => color, "date" => date})
    end
  end

  defp create(type, params) do
    [Map.merge(%{"type" => type}, params)]
  end

end

defimpl String.Chars, for: Map do
  @doc """
  Map to string
  """
  def to_string(map) do
    case map["type"] do
      "circle" ->
        "Circle: Center: {#{map["x"]}, #{map["y"]}}, Radius: #{map["r"]}, Color: #{map["color"]}, Date: #{map["date"]}"
      "rectangle" ->
        "Rectangle: Point 1: {#{map["x1"]}, #{map["y1"]}}, Point 2: {#{map["x2"]}, #{map["y2"]}}, Color: #{map["color"]}, Date: #{map["date"]}"
      "triangle" ->
        "Triangle: Point 1: {#{map["x1"]}, #{map["y1"]}}, Point 2: {#{map["x2"]}, #{map["y2"]}}, Point 3: {#{map["x3"]}, #{map["y3"]}}, Color: #{map["color"]}, Date: #{map["date"]}"
      _ -> "Map{#{Enum.map(map, fn {k, v} -> "#{k}: #{v}" end) |> Enum.join(", ")}}"
    end
  end
end
