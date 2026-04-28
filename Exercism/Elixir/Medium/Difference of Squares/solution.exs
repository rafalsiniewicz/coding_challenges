defmodule Squares do
  @moduledoc """
  Calculate sum of squares, square of sum, difference between two sums from 1 to a given end number.
  """

  @doc """
  Calculate sum of squares from 1 to a given end number.
  """
  @spec sum_of_squares(pos_integer) :: pos_integer
  def sum_of_squares(number) do
    number * (number + 1) * (2 * number + 1) / 6 |> round()
  end

  @doc """
  Calculate square of sum from 1 to a given end number.
  """
  @spec square_of_sum(pos_integer) :: pos_integer
  def square_of_sum(number) do
    :math.pow((1+number)/2 * number, 2) |> round()
  end

  @doc """
  Calculate difference between sum of squares and square of sum from 1 to a given end number.
  """
  @spec difference(pos_integer) :: pos_integer
  def difference(number) do
    square_of_sum(number) - sum_of_squares(number)
  end
end

{time_microseconds, result} =
  :timer.tc(fn ->
    Squares.difference(100) |> IO.inspect()
    Squares.difference(100) |> IO.inspect()
    Squares.difference(100) |> IO.inspect()
    Squares.difference(100) |> IO.inspect()
    Squares.difference(100) |> IO.inspect()
    Squares.difference(100) |> IO.inspect()
    Squares.difference(1000_000_000_000_000_000_000_000_000_000_000_000) |> IO.inspect()
  end)

time_microseconds / 1000_000 |> IO.inspect()
