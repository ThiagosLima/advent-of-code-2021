defmodule Lanternfish do
  @moduledoc """
  Documentation for `Lanternfish`.
  """

  def fishes_after_days(days, initial) do
    Enum.reduce(1..days//1, initial, fn _day, fishes -> multiply(fishes) end)
    |> Enum.count
  end

  defp multiply(fishes) do
    zeros = Enum.count(fishes, &(&1 === 0))

    fishes
    |> Enum.map(fn fish ->
      if fish == 0, do: 6, else: fish - 1
    end)
    |> Enum.concat(Enum.take(Stream.cycle([8]), zeros))
  end
end
