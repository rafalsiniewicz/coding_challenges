defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @arabic_to_roman %{
    1000 => "M",
    500 => "D",
    100 => "C",
    50 => "L",
    10 => "X",
    5 => "V",
    1 => "I",
    4 => "IV",
    9 => "IX",
    40 => "XL",
    90 => "XC",
    400 => "CD",
    900 => "CM"
  }


  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    digits_list = number |> Integer.to_string() |> String.codepoints() |> Enum.map(& String.to_integer/1)
    number_of_digits = length(digits_list)
    Enum.reduce(digits_list, {"", number_of_digits},
    fn 0, {result_string, digit_position} -> {result_string, digit_position - 1}
    digit, {result_string, digit_position} ->
      multiplier = Integer.pow(10, digit_position - 1)
      base_number = digit * multiplier
      case @arabic_to_roman[base_number] do
        nil ->
          cond do
            digit < 5 -> {result_string <> (Enum.map(1..digit, fn _ -> @arabic_to_roman[multiplier] end) |> to_string()), digit_position - 1}
            digit > 5 -> {result_string <> (@arabic_to_roman[5 * multiplier] <> (Enum.map(1..(digit - 5), fn _ -> @arabic_to_roman[multiplier] end) |> to_string())), digit_position - 1}
          end
        roman_number ->
          {result_string <> roman_number, digit_position - 1}
      end
    end)
    |> elem(0)
  end

  # @spec numeral(pos_integer) :: String.t()
  # def numeral(number) do
  #   do_numeral(number, "")
  # end

  # defp do_numeral(number, acc) when number >= 1000 do
  #   do_numeral(number - 1000, acc <> "M")
  # end

  # defp do_numeral(number, acc) when number >= 900 do
  #   do_numeral(number - 900, acc <> "CM")
  # end

  # defp do_numeral(number, acc) when number >= 500 do
  #   do_numeral(number - 500, acc <> "D")
  # end

  # defp do_numeral(number, acc) when number >= 400 do
  #   do_numeral(number - 400, acc <> "CD")
  # end

  # defp do_numeral(number, acc) when number >= 100 do
  #   do_numeral(number - 100, acc <> "C")
  # end

  # defp do_numeral(number, acc) when number >= 90 do
  #   do_numeral(number - 90, acc <> "XC")
  # end

  # defp do_numeral(number, acc) when number >= 50 do
  #   do_numeral(number - 50, acc <> "L")
  # end

  # defp do_numeral(number, acc) when number >= 40 do
  #   do_numeral(number - 40, acc <> "XL")
  # end

  # defp do_numeral(number, acc) when number >= 10 do
  #   do_numeral(number - 10, acc <> "X")
  # end

  # defp do_numeral(number, acc) when number >= 9 do
  #   do_numeral(number - 9, acc <> "IX")
  # end

  # defp do_numeral(number, acc) when number >= 5 do
  #   do_numeral(number - 5, acc <> "V")
  # end

  # defp do_numeral(number, acc) when number >= 4 do
  #   do_numeral(number - 4, acc <> "IV")
  # end

  # defp do_numeral(number, acc) when number >= 1 do
  #   do_numeral(number - 1, acc <> "I")
  # end

  # defp do_numeral(_number, acc) do
  #   acc
  # end

  # @spec numeral(pos_integer) :: String.t()
  # def numeral(number) when number >= 1000 do
  #   "M" <> numeral(number - 1000)
  # end

  # def numeral(number) when number >= 900 do
  #   "CM" <> numeral(number - 900)
  # end

  # def numeral(number) when number >= 500 do
  #   "D" <> numeral(number - 500)
  # end

  # def numeral(number) when number >= 400 do
  #   "CD" <> numeral(number - 400)
  # end

  # def numeral(number) when number >= 100 do
  #   "C" <> numeral(number - 100)
  # end

  # def numeral(number) when number >= 90 do
  #   "XC" <> numeral(number - 90)
  # end

  # def numeral(number) when number >= 50 do
  #   "L" <> numeral(number - 50)
  # end

  # def numeral(number) when number >= 40 do
  #   "XL" <> numeral(number - 40)
  # end

  # def numeral(number) when number >= 10 do
  #   "X" <> numeral(number - 10)
  # end

  # def numeral(number) when number >= 9 do
  #   "IX" <> numeral(number - 9)
  # end

  # def numeral(number) when number >= 5 do
  #   "V" <> numeral(number - 5)
  # end

  # def numeral(number) when number >= 4 do
  #   "IV" <> numeral(number - 4)
  # end

  # def numeral(number) when number >= 1 do
  #   "I" <> numeral(number - 1)
  # end

  # def numeral(_number), do: ""

end


IO.inspect(RomanNumerals.numeral(123))
IO.inspect(RomanNumerals.numeral(57))
IO.inspect(RomanNumerals.numeral(318))
IO.inspect(RomanNumerals.numeral(29))
IO.inspect(RomanNumerals.numeral(3999))
IO.inspect(RomanNumerals.numeral(40))
IO.inspect(RomanNumerals.numeral(142))
IO.inspect(RomanNumerals.numeral(6000))
