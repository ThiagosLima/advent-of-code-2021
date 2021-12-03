defmodule BinaryDiagnostic do
  @moduledoc """
  Documentation for `BinaryDiagnostic`.
  """

  def co2_scrubber(report) do
    report
    |> co2_scrubber(0)
    |> list_to_number
  end

  defp co2_scrubber([rating], _), do: rating

  defp co2_scrubber(report, digit) do
    least = get_least(report)

    report
    |> Enum.filter(fn rating ->
      Enum.at(rating, digit) == Enum.at(least, digit)
    end)
    |> co2_scrubber(digit + 1)
  end

  def oxygen_generator(report) do
    report
    |> oxygen_generator(0)
    |> list_to_number
  end

  defp oxygen_generator([row], _), do: row

  defp oxygen_generator(report, digit) do
    most = get_most(report)

    report
    |> Enum.filter(fn row ->
      Enum.at(row, digit) == Enum.at(most, digit)
    end)
    |> oxygen_generator(digit + 1)
  end

  defp get_most(report) do
    report
    |> transpose
    |> Enum.map(&if ones(&1) >= zeros(&1), do: "1", else: "0")
  end

  defp get_least(report) do
    report
    |> transpose
    |> Enum.map(&if zeros(&1) <= ones(&1), do: "0", else: "1")
  end

  defp zeros(row) do
    Enum.count(row, &(&1 == "0"))
  end

  defp ones(row) do
    Enum.count(row, &(&1 == "1"))
  end

  def power_consumption(report) do
    gama = get_gama(report)
    epsilon = get_epsilon(report)

    gama * epsilon
  end

  defp get_gama(report) do
    report
    |> get_most
    |> list_to_number
  end

  defp get_epsilon(report) do
    report
    |> get_least
    |> list_to_number
  end

  defp list_to_number(list) do
    list
    |> Enum.join("")
    |> String.to_integer(2)
  end

  defp parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.codepoints/1)
  end

  defp transpose(input) do
    input
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def part_one() do
    {:ok, contents} = File.read("./lib/input.txt")

    contents
    |> parse
    |> power_consumption
  end

  def part_two() do
    {:ok, contents} = File.read("./lib/input.txt")

    oxigen =
      contents
      |> parse
      |> oxygen_generator

    co2 =
      contents
      |> parse
      |> co2_scrubber

    oxigen * co2
  end
end
