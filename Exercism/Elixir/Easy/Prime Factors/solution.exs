defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  # @spec factors_for(pos_integer) :: [pos_integer]
  # def factors_for(number) do
  #   # Enum.reduce_while(2..div(number, 2), {number, []}, fn x, acc = {num, ret} ->
  #   #   if num == 1, do: {:halt, ret}
  #   #   if prime?(x) and rem(num, x) == 0 do
  #   #     {:cont, {div(num, x), ret ++ [x]}}
  #   #   else
  #   #     {:cont, acc}
  #   #   end
  #   # end)
  #   Stream.resource(fn -> {number, 2} end, fn {number, divisor} ->
  #     # IO.inspect({number, divisor})
  #     cond do
  #       number == 1 or is_nil(number) ->
  #         {:halt, nil}
  #       divisor * divisor > number -> {[number], {nil, nil}}
  #       divisor >= 5 ->
  #         cond do
  #           prime?(divisor) and rem(number, divisor) == 0 ->
  #             {[divisor], {div(number, divisor), divisor}}
  #           prime?(divisor + 2) and rem(number, divisor + 2) == 0 ->
  #             {[divisor + 2], {div(number, divisor + 2), divisor + 2}}
  #           true ->
  #             {[], {number, divisor + 6}}
  #         end
  #       prime?(divisor) and rem(number, divisor) == 0 ->
  #         {[divisor], {div(number, divisor), divisor}}
  #       true ->
  #         {[], {number, divisor + 1}}
  #     end
  #   end, fn _ -> nil end) |> Enum.to_list()
  # end

  # def prime?(number) when number in [2,3], do: true
  # def prime?(number) when number > 3 do
  #   cond do
  #     rem(number, 2) == 0 or rem(number, 3) == 0 ->
  #       false
  #     true ->
  #       Enum.reduce_while(5..round(:math.sqrt(number))//6, true, fn x, acc ->
  #         if rem(number, x) == 0 or rem(number, x + 2) == 0 do
  #           {:halt, false}
  #         else
  #           {:cont, acc}
  #         end
  #       end)
  #   end
  # end



  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    do_factors_for(number, 2)
  end

  defp do_factors_for(1, _), do: []
  defp do_factors_for(number, div) when div * div > number, do: [number]
  defp do_factors_for(number, div) do
    if rem(number, div) == 0 do
      [div] ++ do_factors_for(div(number, div), div)
    else
      do_factors_for(number, div + 1)
    end
  end
end

{time, result} = :timer.tc(fn ->
IO.inspect(PrimeFactors.factors_for(60))
PrimeFactors.factors_for(27) |> IO.inspect()
PrimeFactors.factors_for(625) |> IO.inspect()
PrimeFactors.factors_for(901_255) |> IO.inspect()
PrimeFactors.factors_for(93_819_012_551) |> IO.inspect()
PrimeFactors.factors_for(10_000_000_055) |> IO.inspect()
# PrimeFactors.prime?(10_000_000_055) |> IO.inspect()
end)

time / 1000_000 |> IO.inspect()

# PrimeFactors.sieve(10_000_000_055)
# # |> Enum.filter(& &1 == true)
# |> IO.inspect()
