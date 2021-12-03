defmodule BinaryDiagnostic do
  @moduledoc """
  Documentation for `BinaryDiagnostic`.
  """

  def power_consumption(report) do
    most_common_bit =
      report
      |> Enum.map(fn d -> Enum.sum(d) > Enum.count(d) / 2 end)

    gama =
      most_common_bit
      |> Enum.map(&if &1, do: "1", else: "0")
      |> Enum.join("")
      |> String.to_integer(2)

    epsilon =
      most_common_bit
      |> Enum.map(&if &1, do: "0", else: "1")
      |> Enum.join("")
      |> String.to_integer(2)

    gama * epsilon
  end

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn binary ->
      binary
      |> String.codepoints()
      |> Enum.map(&String.to_integer/1)
    end)
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
