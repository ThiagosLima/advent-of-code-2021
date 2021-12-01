defmodule SonarSweepTest do
  use ExUnit.Case
  doctest SonarSweep

  test "the are no increase if there are no measures" do
    assert SonarSweep.increase([]) == 0
  end

  test "the are no increase" do
    assert SonarSweep.increase([1, 1, 1]) == 0
  end

  test "the are two increases" do
    assert SonarSweep.increase([0, 1, 2]) == 2
  end

  test "sliding window" do
    measures = [0, 1, 2, 3, 4]
    assert SonarSweep.sliding_window(measures) == [3, 6, 9]
  end
end
