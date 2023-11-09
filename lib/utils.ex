defmodule Utils do

  def toInt(value) do
    cond do
      is_integer(value) -> value
      is_binary(value) -> Integer.parse(value) |> case do
        {intv, _} -> intv
        _ -> raise "[E] Not converted value to Integer: #{value}"
      end
      true -> raise "[E] Not converted value to Integer: #{value}"
    end
  end

  def toFloat(value) do
    cond do
      is_float(value) -> value
      is_binary(value) -> Float.parse(value) |> case do
        {intv, _} -> intv
        _ -> raise "[E] Not converted value to Integer: #{value}"
      end
      true -> raise "[E] Not converted value to Integer: #{value}"
    end
  end

  def intParse(value, replacement) do
    cond do
      is_binary(value) -> Integer.parse(value) |> case do
        {intv, _} -> intv
        _ -> replacement
      end
      true -> replacement
    end
  end

  def floatParse(value, replacement) do
    cond do
      is_binary(value) -> Float.parse(value) |> case do
        {intv, _} -> intv
        _ -> replacement
      end
      true -> replacement
    end
  end

  def checkColor(color) do
    case color do
      "red" -> true
      "orange" -> true
      "yellow" -> true
      "green" -> true
      "azure" -> true
      "blue" -> true
      "purple" -> true
      _ -> false
    end
  end

  def checkDate(date) do
    re = ~r/(0?[1-9]|[12][0-9]|3[01])[\-](0?[1-9]|1[012])[\-]([0-9]?[0-9]?[0-9]?[0-9])/
    date =~ re
  end
end
