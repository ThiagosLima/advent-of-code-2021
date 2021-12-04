defmodule GiantSquid do
  @moduledoc """
  Documentation for `GiantSquid`.
  """

  def winning_row(matrix) do
    Enum.count(matrix, fn row -> Enum.filter(row, &(&1 != nil)) != [] end) != 5
  end

  def winning_col(matrix) do
    matrix
    |> transpose
    |> winning_row
  end

  defp transpose(matrix) do
    matrix
    |> Enum.zip
    |> Enum.map(&Tuple.to_list/1)
  end
end
