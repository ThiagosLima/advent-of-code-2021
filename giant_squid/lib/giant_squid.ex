defmodule GiantSquid do
  @moduledoc """
  Documentation for `GiantSquid`.
  """

  def winning_row(matrix) do
    Enum.count(matrix, fn row -> Enum.filter(row, &(&1 != nil)) != [] end) != 5
  end
end
