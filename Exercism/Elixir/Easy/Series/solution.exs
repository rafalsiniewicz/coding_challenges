defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size < 1, do: []

  def slices(s, size) do
    s_length = String.length(s)
    if size > s_length do
      []
    else
      Enum.reduce(0..s_length - size, [], fn i, acc ->
        acc ++ [String.slice(s, i, size)]
      end)
    end
  end
end

IO.inspect(StringSeries.slices("49142", 3))
IO.inspect(StringSeries.slices("49142", 4))
IO.inspect(StringSeries.slices("49142", 5))
IO.inspect(StringSeries.slices("49142", 6))
