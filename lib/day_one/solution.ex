defmodule Aoc2015.DayOne.Solution do
  require Logger

  def process_input(aoc_input) do
    items = String.graphemes(aoc_input)
    Logger.info("input length: #{String.length(aoc_input)}")

    floor = Enum.reduce(items, 0, fn i, acc ->
      if i == "(" do
        acc + 1
      else
        acc - 1
      end
    end)

    # floor = for x <- items do`
    #   if x == "(", do: santa + 1, else: santa - 1
    # end

    floor
  end
end
