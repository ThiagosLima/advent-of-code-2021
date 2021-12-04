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

  test "there is a winning col" do
    matrix = [
      [nil, 0, 0, 0, 0],
      [nil, 0, 0, 0, 0],
      [nil, 0, 0, 0, 0],
      [nil, 0, 0, 0, 0],
      [nil, 0, 0, 0, 0]
    ]

    assert GiantSquid.winning_col(matrix) == true
  end

  test "there is not a winning col" do
    matrix = [
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ]

    assert GiantSquid.winning_col(matrix) == false
  end
end
