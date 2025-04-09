defmodule Aoc2015.DayOne.Solution do
  require Logger

  @spec part_one(binary()) :: integer()
  def part_one(aoc_input) do
    items = String.graphemes(aoc_input)
    Logger.info("input length: #{String.length(aoc_input)}")

    floor = Enum.reduce(items, 0, fn i, acc ->
      if i == "(" do
        acc + 1
      else
        acc - 1
      end
    end)

    floor # return the final floor
  end

  @spec part_two(binary()) :: integer()
  def part_two(aoc_input) do
    data = String.split(aoc_input, "", trim: true)
    Logger.info("input length: #{data}")

    result = data
    |> Enum.with_index
    |> Enum.reduce_while(0, fn({item, idx}, acc) ->
      if acc > -1 do
        {:cont,
        if item == "(" do
          acc + 1
        else
          acc - 1
        end}
      else
        {:halt, idx}
      end
    end)

   Logger.info("is the result an integer? #{is_integer(result)}")
   result # return the index where we hit the basement
  end
end
