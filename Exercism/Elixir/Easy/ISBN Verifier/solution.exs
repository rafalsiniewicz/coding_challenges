defmodule IsbnVerifier do
  @available_digits ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  @available_check_numbers ["X"]

  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  # @spec isbn?(String.t()) :: boolean
  # def isbn?(isbn) do
  #   isbn
  #   |> String.replace("-", "")
  #   |> String.codepoints()
  #   |> then(fn codepoints ->
  #     case valid_isbn_codepoints?(codepoints) do
  #       true ->
  #         codepoints
  #         |> Enum.reduce({0, 10}, fn char, {value, multiplier} ->
  #           case char do
  #             "X" ->
  #               {value + 10 * multiplier, multiplier - 1}
  #             number ->
  #               {value + String.to_integer(number) * multiplier, multiplier - 1}
  #           end
  #         end)
  #         |> elem(0)
  #         |> rem(11) == 0
  #       _ -> false
  #     end
  #   end
  #   )
  # end

  # defp valid_isbn_codepoints?(codepoints) do
  #   length(codepoints) == 10
  #   and Enum.all?(Enum.take(codepoints, 9), & &1 in @available_digits)
  #   and List.last(codepoints) in @available_digits ++ @available_check_numbers
  # end

  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    isbn
    |> String.replace("-", "")
    |> String.codepoints()
    |> Enum.reduce_while({0, 10}, fn char, {value, multiplier} ->
      case {char, multiplier} do
        {"X", 1} -> {:cont, {value + multiplier * 10, multiplier - 1}}
        {digit, _} when digit in @available_digits -> {:cont, {value + multiplier * String.to_integer(digit), multiplier - 1}}
        _ -> {:halt, {1, nil}}
      end
    end)
    |> case do
      {value, 0} -> rem(value, 11) == 0
      _ -> false
    end
  end
end


IO.inspect(IsbnVerifier.isbn?("3-598-21507-X"))
IO.inspect(IsbnVerifier.isbn?("3-598-2K507-0"))
