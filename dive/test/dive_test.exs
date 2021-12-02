defmodule DiveTest do
  use ExUnit.Case
  doctest Dive

  test "don't move if there is no course" do
    assert Dive.move([]) == %{horizontal: 0, depth: 0}
  end

  test "go to the right position" do
    assert Dive.move([
             %{direction: "forward", quantity: 5},
             %{direction: "down", quantity: 5},
             %{direction: "forward", quantity: 8},
             %{direction: "up", quantity: 3},
             %{direction: "down", quantity: 8},
             %{direction: "forward", quantity: 2}
           ]) == %{horizontal: 15, depth: 10}
  end
end
