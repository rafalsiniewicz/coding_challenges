defmodule Say do
  @digits %{
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }

  @teens %{
    0 => "ten",
    1 => "eleven",
    2 => "twelve",
    3 => "thirteen",
    4 => "fourteen",
    5 => "fifteen",
    6 => "sixteen",
    7 => "seventeen",
    8 => "eighteen",
    9 => "nineteen"
  }

  @tens %{
    0 => "",
    2 => "twenty",
    3 => "thirty",
    4 => "forty",
    5 => "fifty",
    6 => "sixty",
    7 => "seventy",
    8 => "eighty",
    9 => "ninety"
  }

  @magnitude %{
    0 => "",
    3 => "thousand",
    6 => "million",
    9 => "billion"
  }

  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number not in 0..999_999_999_999, do: {:error, "number is out of range"}
  def in_english(number) do
    number
    |> Integer.digits()
    |> then(& {:ok, do_in_english(&1)})
  end

  defp do_in_english([]), do: ""
  defp do_in_english([digit]), do: @digits[digit]
  defp do_in_english([0, 0, 0 | tail]), do: do_in_english(tail)
  defp do_in_english([0, 0 | tail]), do: do_in_english(tail)
  defp do_in_english([0 | tail]), do: do_in_english(tail)
  defp do_in_english([1, second]), do: @teens[second]
  defp do_in_english([first, 0]), do: @tens[first]
  defp do_in_english([first, second]), do: @tens[first] <> "-" <> do_in_english([second])
  defp do_in_english([first, second, third | tail]) when rem(length(tail), 3) == 0, do: @digits[first] <> " hundred" <> maybe_space([second, third]) <> do_in_english([second, third]) <> maybe_space(tail) <> @magnitude[length(tail)] <> maybe_space(length(tail)) <> do_in_english(tail)
  defp do_in_english([first | tail]) when rem(length(tail), 3) == 0, do: @digits[first] <> " " <> @magnitude[length(tail)] <> maybe_space(tail) <> do_in_english(tail)
  defp do_in_english([first, second | tail]) when rem(length(tail), 3) == 0, do: do_in_english([first, second]) <> " " <> @magnitude[length(tail)] <> " " <> do_in_english(tail)

  defp maybe_space(0), do: ""
  defp maybe_space([]), do: ""
  defp maybe_space([_ | _] = list) do
    if Enum.all?(list, fn elem -> elem == 0 end), do: "", else: " "
  end
  defp maybe_space(_), do: " "
end


Say.in_english(1) |> IO.inspect()
Say.in_english(-1) |> IO.inspect()
Say.in_english(101) |> IO.inspect()
Say.in_english(100) |> IO.inspect()
Say.in_english(1000) |> IO.inspect()
Say.in_english(1000_000) |> IO.inspect()
Say.in_english(10061) |> IO.inspect()
Say.in_english(100061) |> IO.inspect()
Say.in_english(1000061) |> IO.inspect()
Say.in_english(1001) |> IO.inspect()
Say.in_english(10001) |> IO.inspect()
Say.in_english(100001) |> IO.inspect()
Say.in_english(12) |> IO.inspect()
Say.in_english(123) |> IO.inspect()
Say.in_english(1234) |> IO.inspect()
Say.in_english(12345) |> IO.inspect()
Say.in_english(123456) |> IO.inspect()
Say.in_english(1234567) |> IO.inspect()
Say.in_english(12345678) |> IO.inspect()
Say.in_english(123456789) |> IO.inspect()
Say.in_english(12345678911) |> IO.inspect()
Say.in_english(1234567890011) |> IO.inspect()
