defmodule LanternfishTest do
  use ExUnit.Case
  doctest Lanternfish

  test "fihes after 0 days" do
    initial = [3,4,3,1,2]

    assert Lanternfish.fishes_after_days(0, initial) == 5
  end

  test "fihes after 18 days" do
    initial = [3,4,3,1,2]

    assert Lanternfish.fishes_after_days(18, initial) == 26
  end

  test "fihes after 80 days" do
    initial = [3,4,3,1,2]

    assert Lanternfish.fishes_after_days(80, initial) == 5934
  end
end
