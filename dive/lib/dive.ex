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
end
