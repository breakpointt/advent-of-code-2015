defmodule Aoc2015.DayThree.Solution do
  require Logger
  @moduledoc """

  """

  def make_delivery("^", location) do
    List.update_at(location, 1, &(&1 + 1))
  end

  def make_delivery("v", location) do
    List.update_at(location, 1, &(&1 - 1))
  end

  def make_delivery("<", location) do
    List.update_at(location, 0, &(&1 - 1))
  end

  def make_delivery(">", location) do
    List.update_at(location, 0, &(&1 + 1))
  end

  def santa_delivery([], location_list) do
    location_list
  end

  def santa_delivery([first | rest], location_list) do
    santa_delivery(rest, List.insert_at(location_list, -1, make_delivery(first, List.last(location_list))))
  end

  def two_santa_delivery(house_map, location_list) do
    santa_list = house_map |> tl() |> Enum.take_every(2)
    robo_santa_list = house_map |> Enum.take_every(2)

    Enum.concat(santa_delivery(santa_list, location_list), santa_delivery(robo_santa_list, location_list))
  end

end
