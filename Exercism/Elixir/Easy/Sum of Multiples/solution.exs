defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, []), do: 0
  def to(limit, [_h] = factors) do
    Enum.sum_by(factors, &multiples_sum(limit, &1))
  end
  def to(limit, factors) do
    subsets = all_subsets(factors) |> IO.inspect()
    for s <- subsets do
      IO.inspect(s)
      lcm = Enum.reduce(s, & lcm(&1, &2)) |> IO.inspect()
      multiplicator = (if rem(length(s), 2) == 1, do: 1, else: -1) |> IO.inspect()
      multiplicator * multiples_sum(limit, lcm) |> IO.inspect()
    end
    |> Enum.sum()
  end

  defp multiples_sum(limit, 0), do: 0
  defp multiples_sum(limit, factor) do
    n = Integer.floor_div(limit - 1, factor)
    factor * (n + 1) * n / 2
  end

  # defp lcm(a), do: a
  defp lcm(a, b) when a == 0 or b == 0, do: 0
  defp lcm(a, b), do: abs(a * b) |> div(Integer.gcd(a, b))

  def all_subsets(list) do
    for j <- 0..length(list)-1 do
      for i <- j..length(list)-1 do
        Enum.slice(list, j..i)
      end
    end
    |> Enum.flat_map(& &1)
  end


  # @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  # def to(_limit, []), do: 0
  # def to(limit, factors) do
  #   Enum.flat_map(factors, & all_multiples(limit, &1))
  #   |> Enum.uniq()
  #   |> Enum.sum()
  # end

  # defp all_multiples(_limit, 0), do: [0]
  # defp all_multiples(limit, factor) do
  #   for i <- factor..limit-1//factor do
  #     i
  #   end
  # end
end

{time_us, result} =
  :timer.tc(fn ->
# IO.inspect(SumOfMultiples.to(20, [3, 5]))
# IO.inspect(SumOfMultiples.to(1000, [3, 5]))
# IO.inspect(SumOfMultiples.to(10000, [43, 47]))
# IO.inspect(SumOfMultiples.to(10000, []))
# IO.inspect(SumOfMultiples.to(10000, [2, 3, 5, 7, 11]))
# IO.inspect(SumOfMultiples.to(100, [1]))
# IO.inspect(SumOfMultiples.to(7, [3]))
IO.inspect(SumOfMultiples.to(150, [5, 6, 8]))
end)




IO.puts("Time: #{time_us} μs")
