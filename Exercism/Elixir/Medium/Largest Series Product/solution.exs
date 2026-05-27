defmodule Series do
  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t(), non_neg_integer) :: non_neg_integer
  def largest_product(_number_string, size) when size <= 0, do: raise ArgumentError
  def largest_product(number_string, size) do
    if size > String.length(number_string) do
      raise ArgumentError
    else
      number_string
      |> String.to_integer()
      |> Integer.digits()
      |> Enum.chunk_every(size, 1, :discard)
      |> Enum.map(& Enum.product/1)
      |> Enum.max(&>=/2, fn -> 0 end)
    end
  end
end


Series.largest_product("63915", 3) |> IO.inspect()
Series.largest_product("123", 4) |> IO.inspect()
