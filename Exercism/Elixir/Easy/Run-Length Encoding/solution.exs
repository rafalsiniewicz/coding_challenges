defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""

  def encode(string) do
    charlist = String.to_charlist(string)
    Enum.reduce(charlist, {"", List.first(charlist), 0, 1}, fn char, {encoded_string, prev_char, count, i} ->
      if char == prev_char do
        if i == length(charlist) do
          encoded_string = if count >= 1, do: encoded_string <> "#{count + 1}", else: encoded_string
          encoded_string <> <<prev_char>>
        else
          {encoded_string, char, count + 1, i + 1}
        end
      else
        encoded_string = if count > 1, do: encoded_string <> "#{count}", else: encoded_string
        encoded_string = encoded_string <> <<prev_char>>
        if i == length(charlist) do
          encoded_string <> <<char>>
        else
          {encoded_string, char, 1, i + 1}
        end
      end
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""

  def decode(string) do
    charlist = String.to_charlist(string)
    Enum.reduce(charlist, {"", "", 1}, fn char, {decoded_string, count, i} ->
      if char >= ?0 and char <= ?9 do
        {decoded_string, count <> "#{<<char>>}", i + 1}
      else
        decoded_string =
        if count == "" do
          decoded_string <> <<char>>
        else
          decoded_string <> String.duplicate(<<char>>, String.to_integer(count))
        end

        if i == length(charlist) do
          decoded_string
        else
          {decoded_string, "", i + 1}
        end
      end
    end)
  end
end


IO.inspect(RunLengthEncoder.encode("AABBBCCCC"))
IO.inspect(RunLengthEncoder.decode("2A3B4C"))
IO.inspect(RunLengthEncoder.encode("XYZ"))
IO.inspect(RunLengthEncoder.decode("XYZ"))
IO.inspect(RunLengthEncoder.encode("  hsqq qww  ")) # "2 hs2q q2w2 "
