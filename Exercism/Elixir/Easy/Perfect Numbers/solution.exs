defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <= 0 do
    {:error, "Classification is only possible for natural numbers."}
  end

  # def classify(number) when number in [1,2] do
  #   {:ok, :deficient}
  # end

  def classify(number) do
    factors_sum = get_factors_sum(number)
    classification = cond do
      factors_sum == number -> :perfect
      factors_sum > number -> :abundant
      true -> :deficient
    end
    {:ok, classification}
  end

  defp get_factors_sum(number) do
    Enum.reduce(1..(div(number, 2))//1, 0, fn x, acc ->
      if rem(number, x) == 0 do
        acc + x
      else
        acc
      end
    end)
  end
end


PerfectNumbers.classify(6) |> IO.inspect()
# PerfectNumbers.classify(9) |> IO.inspect()
PerfectNumbers.classify(28) |> IO.inspect()
PerfectNumbers.classify(12) |> IO.inspect()
PerfectNumbers.classify(24) |> IO.inspect()
PerfectNumbers.classify(8) |> IO.inspect()
PerfectNumbers.classify(33_550_337) |> IO.inspect()
PerfectNumbers.classify(1) |> IO.inspect()
PerfectNumbers.classify(2) |> IO.inspect()
