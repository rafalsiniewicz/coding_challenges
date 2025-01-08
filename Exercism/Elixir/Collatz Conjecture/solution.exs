defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 and is_integer(input) do
    do_calc(input, 0)
  end

  defp do_calc(_input = 1, acc) do
    acc
  end

  defp do_calc(input, acc) when rem(input, 2) == 1 do
    do_calc(3 * input + 1, acc + 1)
  end

  defp do_calc(input, acc) do
    do_calc(div(input, 2), acc + 1)
  end

end


# 1
CollatzConjecture.calc(12) |> IO.inspect()
