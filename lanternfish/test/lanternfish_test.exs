defmodule LanternfishTest do
  use ExUnit.Case
  doctest Lanternfish

  test "fihes after 0 days" do
    initial = [3, 4, 3, 1, 2]

    assert Lanternfish.fishes_after_days(initial, 0) == 5
  end

  test "fihes after 18 days" do
    initial = [3, 4, 3, 1, 2]

    assert Lanternfish.fishes_after_days(initial, 18) == 26
  end

  test "fihes after 80 days" do
    initial = [3, 4, 3, 1, 2]

    assert Lanternfish.fishes_after_days(initial, 80) == 5934
  end
end
