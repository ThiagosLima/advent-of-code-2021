defmodule GiantSquidTest do
  use ExUnit.Case
  doctest GiantSquid

  test "there is a winning row" do
    matrix = [
      [nil, nil, nil, nil, nil],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ]

    assert GiantSquid.winning_row(matrix) == true
  end

  test "there is not a winning row" do
    matrix = [
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ]

    assert GiantSquid.winning_row(matrix) == false
  end
end
