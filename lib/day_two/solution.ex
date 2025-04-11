defmodule Aoc2015.DayTwo.Solution do
  @moduledoc """

  From Advent of Code 2015: Day 2

  The elves are running low on wrapping paper, and so they need to submit an order for more. They have a list of the dimensions (length l, width w, and height h) of each present, and only want to order exactly as much as they need.

  Fortunately, every present is a box (a perfect right rectangular prism), which makes calculating the required wrapping paper for each gift a little easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. The elves also need a little extra paper for each present: the area of the smallest side.

  For example:

    A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of wrapping paper plus 6 square feet of slack, for a total of 58 square feet.A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet of wrapping paper plus 1 square foot of slack, for a total of 43 square feet. All numbers in the elves' list are in feet.

    How many total square feet of wrapping paper should they order?
  """
  require Logger

  def convert_binary_to_list(dimension_binary)  do
    # convert string binary
    # split on "x" to get individual side dimensions
    # parse each member of list into an integer value
    # return list as [length, width, height]

    String.split(dimension_binary, "x", trim: true)
    |> Enum.map(fn x -> Integer.parse(x) end)
    |> Enum.map(fn({x, _y}) -> x end)
  end

  def calculate_wrapping_surface(length_width_height_binary) do
    dimensions = convert_binary_to_list(length_width_height_binary)

    length_width_value = Enum.at(dimensions, 0) * Enum.at(dimensions, 1)
    width_height_value = Enum.at(dimensions, 1) * Enum.at(dimensions, 2)
    length_height_value = Enum.at(dimensions, 0) * Enum.at(dimensions, 2)

    values = [length_width_value, width_height_value, length_height_value]

    values
    # |>Enum.map(fn x -> String.to_integer(x) end)
    |>Enum.map(fn x -> x * 2 end)
    |>Enum.sum()
    |>Kernel.then(fn x -> x + Enum.min(values) end)
  end

  def calculate_ribbon_length(length_width_height_binary) do
    dimensions = convert_binary_to_list(length_width_height_binary)

    bow_ribbon_length = Enum.reduce(dimensions, 1, fn x, acc-> x * acc end)
    box_ribbon_length = Enum.sort(dimensions)
                        |> Enum.slice(0..1)
                        |> Enum.reduce(0, fn x, acc -> acc + (x * 2) end)

    box_ribbon_length + bow_ribbon_length

  end
end
