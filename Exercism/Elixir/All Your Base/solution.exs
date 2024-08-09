defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, input_base, _output_base) when input_base < 2 do
    {:error, "input base must be >= 2"}
  end

  def convert(_digits, _input_base, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end

  def convert(digits, input_base, output_base) do
    case Enum.any?(digits, fn d -> d < 0 or d >= input_base end) do
      true -> {:error, "all digits must be >= 0 and < input base"}
      false -> do_convert(digits, input_base, output_base)
    end

  end

  def do_convert(digits, input_base, output_base) do
    decimal = Enum.reduce(Enum.reverse(digits), {0, 0}, fn digit, _acc = {index, value} ->
      {index + 1, value + digit * Integer.pow(input_base, index)}
     end)

     {:ok, decimal_to_base(elem(decimal, 1), output_base)}
  end


  defp decimal_to_base(decimal, base, acc \\ "")

  defp decimal_to_base(_decimal = 0, _base, _acc = "") do
    [0]
  end

  defp decimal_to_base(decimal, _base = 10, _acc) do
    Integer.to_string(decimal)
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  defp decimal_to_base(_decimal = 0, _base, acc) do
    acc
    |> String.split("|", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reverse()
  end

  defp decimal_to_base(decimal, base, acc) do
    case rem(decimal, base) do
      0 -> acc <> "|0"
      rest -> acc <> "|#{rest}"
    end
    |> then(&decimal_to_base(div(decimal, base), base, &1))
  end

end


IO.inspect(AllYourBase.convert([1,0,1], 2, 10))
IO.inspect(AllYourBase.convert([1,0,1], 2, 3))
IO.inspect(AllYourBase.convert([1], 2, 10))
IO.inspect(AllYourBase.convert([5], 10, 2))
IO.inspect(AllYourBase.convert([1, 0, 1, 0, 1, 0], 2, 10))
IO.inspect(AllYourBase.convert([4, 2], 10, 2))
IO.inspect(AllYourBase.convert([1, 1, 2, 0], 3, 16))
IO.inspect(AllYourBase.convert([0], 10, 2))
IO.inspect(AllYourBase.convert([1, -1, 1, 0, 1, 0], 2, 10))
