defmodule Dive do
  @moduledoc """
  Documentation for `Dive`.
  """

  def move(course) do
    Enum.reduce(course, %{horizontal: 0, depth: 0}, fn coordinate, position ->
      case coordinate.direction do
        "forward" ->
          Map.update!(position, :horizontal, &(&1 + coordinate.quantity))

        "up" ->
          Map.update!(position, :depth, &(&1 - coordinate.quantity))

        _down ->
          Map.update!(position, :depth, &(&1 + coordinate.quantity))
      end
    end)
  end

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [direction, quantity] ->
      %{direction: direction, quantity: String.to_integer(quantity)}
    end)
  end
end
