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
end
