defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer()) :: non_neg_integer
  def nth(_count = 0) do
    raise "Count has to be > 0"
  end

  def nth(count) do
    2
    |> Stream.unfold(&{&1, &1+1})
    |> Stream.filter(& prime?(&1))
    |> Enum.take(count)
    |> List.last()
  end

  # def nth(count) do
  #   do_nth(count, 0, 2)
  # end

  @spec prime?(non_neg_integer()) :: boolean()
  defp prime?(_number = 1), do: false
  defp prime?(_number = 2), do: true

  defp prime?(number) do
    Enum.reduce_while(2..round(:math.sqrt(number)), true, fn n, acc ->
      if rem(number, n) == 0 do
        {:halt, false}
      else
        {:cont, acc}
      end
    end)
  end

  # defp do_nth(count, it, n) do
  #   if prime?(n) do
  #     it = it + 1
  #     if it == count do
  #       n
  #     else
  #       n = n + 1
  #       do_nth(count, it, n)
  #     end
  #   else
  #     do_nth(count, it, n+1)
  #   end
  # end
end



times = 1000

measurements =
  for _ <- 1..times do
    {microseconds, _result} =
      :timer.tc(fn ->
        Prime.nth(1)   # 2
        Prime.nth(2)    # 3
        Prime.nth(3)    # 5
        Prime.nth(6)   # 13
        Prime.nth(30)   # 113
        Prime.nth(100)  # 541
        Prime.nth(10001) # 104743
      end)

    microseconds
  end

avg_us = Enum.sum(measurements) / times
avg_s  = avg_us / 1_000_000

IO.puts("Average time (#{times} runs): #{avg_s}s")
