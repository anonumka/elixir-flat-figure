defmodule EffTest do
  use ExUnit.Case
  doctest Eff

  test "greets the world" do
    assert Eff.hello() == :world
  end
end
