defmodule AdventOfCode.DayOne do
  def solve do
    summed_calories = get_input() |> parse_input() |> sum()
    summed_calories |> find_top() |> print_part_one()
    summed_calories |> find_top_three |> print_part_two()
  end

  defp get_input, do: File.read!("lib/advent_of_code/day_one/input.txt")

  defp parse_input(input),
    do: input |> String.split("\n\n") |> Enum.map(&String.split(&1, "\n", trim: true))

  defp sum(calorie_groups) do
    Enum.map(calorie_groups, fn calorie_group ->
      Enum.reduce(calorie_group, 0, fn cal, total -> total + String.to_integer(cal) end)
    end)
  end

  defp find_top(calorie_totals), do: Enum.max(calorie_totals)

  defp find_top_three(calorie_totals),
    do: Enum.sort(calorie_totals, :desc) |> Enum.take(3) |> Enum.sum()

  defp print_part_one(max), do: IO.puts("The Elf with the most calories has: #{max}")

  defp print_part_two(sum), do: IO.puts("The top three Elves are carrying a total of: #{sum}")
end
