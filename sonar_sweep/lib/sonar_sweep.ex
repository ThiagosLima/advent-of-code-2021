defmodule SonarSweep do
  @moduledoc """
  Documentation for `SonarSweep`.
  """

  def increase(measures) do
    measures
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [first, second], total ->
      if second > first, do: total + 1, else: total
    end)
  end
end
