defmodule SonarSweep do
  @moduledoc """
  Documentation for `SonarSweep`.
  """

  def increase(measures) do
    measures
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [first, second], total ->
      if second > first, do: total + 1, else: total
    end)
  end

  def sliding_window(measures) do
    measures
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.map(fn [first, second, third] -> first + second + third end)
  end

  def start() do
    {:ok, contents} = File.read("./lib/input.txt")

    contents
    |> String.split("\n")
    |> Stream.map(&String.to_integer/1)
    |> sliding_window
    |> increase
  end
end
