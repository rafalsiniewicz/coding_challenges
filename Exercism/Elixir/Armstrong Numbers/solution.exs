defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  # @spec valid?(integer) :: boolean
  # def valid?(number) do
  #   digits = get_digits(number)
  #   power = length(digits)

  #   result =
  #     Enum.reduce(digits, 0, fn d, acc ->
  #       acc + d ** power
  #     end)

  #   if result == number, do: true, else: false
  # end

  # defp digits(number) do
  #   Integer.digits(number)
  # end

  # defp get_digits(number) do
  #   Enum.map(number |> Integer.to_string() |> String.codepoints(), fn str ->
  #     String.to_integer(str)
  #   end)
  # end

  @spec valid?(integer) :: boolean
  def valid?(number) when number > -10 and number < 10 do
    true
  end

  def valid?(number) do
    digits = Integer.digits(number)
    result = get_result(digits, length(digits))
    number == result
  end

  defp get_result(digits, pow, acc \\ 0)

  defp get_result([], _pow, acc) do
    acc
  end

  defp get_result([head | tail], pow, acc) do
    get_result(tail, pow, acc + head ** pow)
  end
end

ArmstrongNumber.valid?(132) |> IO.inspect()
