defmodule BinaryDiagnosticTest do
  use ExUnit.Case
  doctest BinaryDiagnostic

  test "power_consumption" do
    report = [
      [0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0],
      [0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
      [0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1],
      [0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0]
    ]

    assert BinaryDiagnostic.power_consumption(report) == 198
  end

  test "parser" do
    input = "00100\n11110\n10110\n10111\n10101\n01111\n00111\n11100\n10000\n11001\n00010\n01010"

    assert BinaryDiagnostic.parse(input) == [
             [0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0],
             [0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1],
             [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
             [0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1],
             [0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0]
           ]
  end
end
