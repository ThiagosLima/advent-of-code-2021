defmodule Lanternfish do
  @moduledoc """
  Documentation for `Lanternfish`.
  """

  def fishes_after_days(initial, days) do
    Enum.reduce(1..days//1, initial, fn _day, fishes -> multiply(fishes) end)
    |> Enum.count()
  end

  defp multiply(fishes) do
    zeros = Enum.count(fishes, &(&1 === 0))

    fishes
    |> Enum.map(fn fish ->
      if fish == 0, do: 6, else: fish - 1
    end)
    |> Enum.concat(Enum.take(Stream.cycle([8]), zeros))
  end

  defp parse(input) do
    input
    |> String.split(",")
    |> Stream.map(&String.to_integer/1)
  end

  def part_one do
    {:ok, contents} = File.read("./lib/input.txt")

    contents
    |> parse
    |> fishes_after_days(80)
  end
end
