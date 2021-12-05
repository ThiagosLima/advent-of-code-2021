defmodule BinaryDiagnostic do
  @moduledoc """
  Documentation for `BinaryDiagnostic`.
  """

  def co2_scrubber(report) do
    co2_scrubber(report, 0)
  end

  defp co2_scrubber([rating], _), do: rating

  defp co2_scrubber(report, digit) do
    least = get_epsilon(report)

    report
    |> Enum.filter(&(Enum.at(&1, digit) == Enum.at(least, digit)))
    |> co2_scrubber(digit + 1)
  end

  def oxygen_generator(report) do
    oxygen_generator(report, 0)
  end

  defp oxygen_generator([row], _), do: row

  defp oxygen_generator(report, digit) do
    most = get_gama(report)

    report
    |> Enum.filter(&(Enum.at(&1, digit) == Enum.at(most, digit)))
    |> oxygen_generator(digit + 1)
  end

  defp zeros(row) do
    Enum.count(row, &(&1 == "0"))
  end

  defp ones(row) do
    Enum.count(row, &(&1 == "1"))
  end

  def power_consumption(report) do
    gama =
      report
      |> get_gama
      |> list_to_number

    epsilon =
      report
      |> get_epsilon
      |> list_to_number

    gama * epsilon
  end

  defp get_gama(report) do
    report
    |> transpose
    |> Enum.map(&if ones(&1) >= zeros(&1), do: "1", else: "0")
  end

  defp get_epsilon(report) do
    report
    |> transpose
    |> Enum.map(&if zeros(&1) <= ones(&1), do: "0", else: "1")
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
      |> list_to_number

    co2 =
      contents
      |> parse
      |> co2_scrubber
      |> list_to_number

    oxigen * co2
  end
end
