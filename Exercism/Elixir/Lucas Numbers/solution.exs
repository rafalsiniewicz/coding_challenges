defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """

  # Eager solution

  # def generate(count) when not is_integer(count) or count < 1 do
  #   raise ArgumentError, message: "count must be specified as an integer >= 1"
  # end

  # def generate(_count = 1) do
  #   [2]
  # end

  # def generate(_count = 2) do
  #   [2, 1]
  # end

  # def generate(count) do
  #   lucas_numbers = generate(count - 1)
  #   lucas_numbers ++ [List.last(lucas_numbers) + Enum.at(lucas_numbers, length(lucas_numbers) - 2)]
  # end

  # Lazy/stream solution

  def generate(count) when not is_integer(count) or count < 1 do
    raise ArgumentError, message: "count must be specified as an integer >= 1"
  end

  def generate(_count = 1) do
    [2]
  end

  def generate(_count = 2) do
    [2, 1]
  end

  def generate(count) do
    Stream.unfold({2, 1}, fn {x, y} ->
      {x, {y, x + y}}
    end
    )
    |> Enum.take(count)
  end


end

# 1
[2] = LucasNumbers.generate(1)

[2, 1] = LucasNumbers.generate(2)

# 2
[2, 1, 3] = LucasNumbers.generate(3)

# [2, 1, 3, 4] = LucasNumbers.generate(4)

# # 3
# LucasNumbers.generate("Hello World")
