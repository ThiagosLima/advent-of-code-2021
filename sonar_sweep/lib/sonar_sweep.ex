defmodule SonarSweep do
  @moduledoc """
  Documentation for `SonarSweep`.
  """

  def increase(measures) do
    measures
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.count(fn [first, second] -> second > first end)
  end

  def sliding_window(measures) do
    measures
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
  end

  defp parse(input) do
    input
    |> String.split("\n")
    |> Stream.map(&String.to_integer/1)
  end

  def start() do
    {:ok, contents} = File.read("./lib/input.txt")

    contents
    |> parse
    |> sliding_window
    |> increase
  end
end
