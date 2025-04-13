defmodule Aoc2015 do
  # use Aoc2015.DayOne.Solution
  @moduledoc """
  Documentation for `Aoc2015`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Aoc2015.hello()
      :world

  """
  require Aoc2015.DayOne.Solution
  require Aoc2015.DayTwo.Solution
  require Aoc2015.DayThree.Solution


  def hello do
    :world
  end

  def day_one_destination_floor do
    parsed_data = File.read!("./assets/day_one_input.txt")
    Aoc2015.DayOne.Solution.part_one(parsed_data)
  end

  def day_one_first_time_in_basement do
    parsed_data = File.read!("./assets/day_one_input.txt")
    Aoc2015.DayOne.Solution.part_two(parsed_data)
  end

  def day_two_total_wrapping_paper do
    # read in the puzzle inoput, parse and split into enum by new lines
    parsed_data = File.read!("./assets/day_two_input.txt")
                  |> String.split("\n", trim: true)

    Enum.reduce(parsed_data, 0, fn x, acc ->
      acc + Aoc2015.DayTwo.Solution.calculate_wrapping_surface(x)
    end)
  end

  def day_two_total_ribbon do
    parsed_data = File.read!("./assets/day_two_input.txt")
                  |> String.split("\n", trim: true)

    Enum.reduce(parsed_data, 0, fn x, acc ->
      acc + Aoc2015.DayTwo.Solution.calculate_ribbon_length(x)
    end)
  end

  def day_three_unique_house_deliveries do
    delivery_map = File.read!("./assets/day_three_input.txt")
                   |> String.graphemes()

    total_deliveries =
      Aoc2015.DayThree.Solution.santa_delivery(delivery_map, [[0,0]])

    length(Enum.uniq(total_deliveries))
  end

  def day_three_two_santas_unique_house_deliveries do
    delivery_map = File.read!("./assets/day_three_input.txt")
                   |> String.graphemes()

    santa_deliveries = Aoc2015.DayThree.Solution.two_santa_delivery(delivery_map, [[0,0]])

    length(Enum.uniq(santa_deliveries))
  end
end
