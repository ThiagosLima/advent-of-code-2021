defmodule BinaryDiagnostic do
  @moduledoc """
  Documentation for `BinaryDiagnostic`.
  """

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn binary ->
      binary
      |> String.codepoints()
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
