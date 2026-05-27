defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t()) :: String.t()
  def encode(str) do
    str
    |> normalize()
    |> case do
      "" -> ""
      normalized ->
        rectangle_size = rectangle_size(normalized) |> IO.inspect()

        normalized
        |> IO.inspect()
        |> rectangle(rectangle_size)
        |> IO.inspect()
        |> coded_message(rectangle_size)
      end
  end

  defp normalize(str) do
    str
    |> String.downcase()
    |> String.replace(Regex.compile!("[[:punct:] ]"), "")
  end

  defp rectangle_size(str) do
    sqrt = str
    |> String.length()
    |> :math.sqrt()

    if sqrt == :math.floor(sqrt) do
      sqrt
    else
      sqrt |> :math.floor() |> Kernel.+(1)
    end
    |> round()
  end

  defp rectangle(str, c) do
    str
    |> String.codepoints()
    |> Enum.chunk_every(c, c, Stream.cycle([" "]))
    |> Enum.map(& Enum.join(&1, ""))
  end

  defp coded_message(list_of_str, c) do
    for i <- 0..c - 1 do
      for j <- 0..length(list_of_str) - 1  do
        Enum.at(list_of_str, j) |> String.at(i)
      end
      |> Enum.join("")
    end
    |> Enum.join(" ")
  end
end

# CryptoSquare.encode("If man was meant to stay on the ground, god would have given us roots.") |> IO.inspect()
# CryptoSquare.encode("abcd") |> IO.inspect()
CryptoSquare.encode("Chill out.") |> IO.inspect()
# String.replace("Witaj, świecie!", Regex.compile!("[[:punct:]]"), "") |> IO.inspect()
