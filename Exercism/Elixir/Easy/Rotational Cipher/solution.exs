defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @number_of_letters 26

  # @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  # def rotate(text, shift) do
  #   shift = rem(shift, @number_of_letters)

  #   text
  #   |> String.to_charlist()
  #   |> Enum.map(fn char ->
  #     cond do
  #       char >= 65 and char <= 90 ->
  #         do_shift(char, 65, shift)
  #       char >= 97 and char <= 122 ->
  #         do_shift(char, 97, shift)
  #       true -> char
  #     end
  #   end)
  #   |> to_string()
  # end

  # defp do_shift(char, start, shift) do
  #   char = char - start
  #   char = char + shift
  #   char = rem(char, @number_of_letters)
  #   char + start
  # end

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(& shift_char(&1, shift))
    |> to_string()
  end

  defp shift_char(char, shift) when char >= ?A and char <= ?Z do
    rem(char - ?A + shift, @number_of_letters) + ?A
  end

  defp shift_char(char, shift) when char >= ?a and char <= ?z do
    rem(char - ?a + shift, @number_of_letters) + ?a
  end

  defp shift_char(char, _shift), do: char

end


IO.inspect(RotationalCipher.rotate("Attack at dawn", 13))
