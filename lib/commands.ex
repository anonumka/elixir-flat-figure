defmodule Commands do

  def print_impl(list) do
    print_impl(list, 0)
  end

  defp print_impl(list, idx) do
    case list do
      [] -> :ok
      [head | tail] -> IO.puts "#{idx} - #{head}"; print_impl(tail, idx + 1)
    end
  end

  def delete_spec_circle(list, x, y, r) do
    case list do
      [] -> []
      [head | tail] ->
        x_attr = Utils.intParse(head["x"], head["x"])
        y_attr = Utils.intParse(head["y"], head["y"])
        r_attr = Utils.intParse(head["r"], head["r"])

        m_x = Utils.intParse(x, x)
        m_y = Utils.intParse(y, y)
        m_r = Utils.intParse(r, r)

        if x_attr == m_x and y_attr == m_y and r_attr == m_r, do: delete_spec_circle(tail, x, y, r), else: [head | delete_spec_circle(tail, x, y, r)]
    end
  end

  def delete_spec_rectangle(list, x1, y1, x2, y2) do
    case list do
      [] -> []
      [head | tail] ->
        x1_attr = Utils.floatParse(head["x1"], head["x1"])
        y1_attr = Utils.floatParse(head["y1"], head["y1"])
        x2_attr = Utils.floatParse(head["x2"], head["x2"])
        y2_attr = Utils.floatParse(head["y2"], head["y2"])

        m_x1 = Utils.floatParse(x1, x1)
        m_y1 = Utils.floatParse(y1, y1)
        m_x2 = Utils.floatParse(x2, x2)
        m_y2 = Utils.floatParse(y2, y2)

        if x1_attr == m_x1 and y1_attr == m_y1 and x2_attr == m_x2 and y2_attr == m_y2, do: delete_spec_rectangle(tail, x1, y1, x2, y2), else: [head | delete_spec_rectangle(tail, x1, y1, x2, y2)]
    end
  end

  def delete_spec_triangle(list, x1, y1, x2, y2, x3, y3) do
    case list do
      [] -> []
      [head | tail] ->
        x1_attr = Utils.floatParse(head["x1"], head["x1"])
        y1_attr = Utils.floatParse(head["y1"], head["y1"])
        x2_attr = Utils.floatParse(head["x2"], head["x2"])
        y2_attr = Utils.floatParse(head["y2"], head["y2"])
        x3_attr = Utils.floatParse(head["x3"], head["x3"])
        y3_attr = Utils.floatParse(head["y3"], head["y3"])

        m_x1 = Utils.floatParse(x1, x1)
        m_y1 = Utils.floatParse(y1, y1)
        m_x2 = Utils.floatParse(x2, x2)
        m_y2 = Utils.floatParse(y2, y2)
        m_x3 = Utils.floatParse(x3, x3)
        m_y3 = Utils.floatParse(y3, y3)

        if x1_attr == m_x1 and y1_attr == m_y1 and x2_attr == m_x2 and y2_attr == m_y2 and x3_attr == m_x3 and y3_attr == m_y3, do: delete_spec_triangle(tail, x1, y1, x2, y2, x3, y3), else: [head | delete_spec_triangle(tail, x1, y1, x2, y2, x3, y3)]
    end
  end

  def rem_check_two_args(list, type, color) do
    cond do
      type not in ["circle", "triangle", "rectangle"] -> IO.puts "[E] Error attribute: #{type}"; list
      true -> rem_shape_color(list, type, color)
    end
  end

  defp rem_shape_color(list, type, color) do
    case list do
      [] -> []
      [head | tail] ->
        m_type = head["type"]
        m_color = head["color"]
        if m_type == type and m_color == color, do: rem_shape_color(tail, type, color), else: [head | rem_shape_color(tail, type, color)]
    end
  end

  def rem_check_one_args(list, type) do
    cond do
      type in ["*"] -> []
      type not in ["circle", "triangle", "rectangle"] -> IO.puts "[E] Error attribute: #{type}"; list
      true -> rem_shape(list, type)
    end
  end

  defp rem_shape(list, type) do
    case list do
      [] -> []
      [head | tail] ->
        m_type = head["type"]
        if m_type == type, do: rem_shape(tail, type), else: [head | rem_shape(tail, type)]
    end
  end

end
