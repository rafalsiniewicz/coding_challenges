defmodule Frequency do
  @punctuation [" ", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "-", "+", "=", "{", "[", "}", "]", ":",
  ";", "'", "\"", "\\", "|", ",", "<", ".", ">", "/", "?", "\t", "\n", "\r", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) when length(texts) < workers, do: frequency(texts, length(texts))
  def frequency([], _workers), do: %{}
  def frequency(texts, workers) do
    current_freq = Enum.map(0..workers-1, & Task.async(fn -> get_freq(Enum.at(texts, &1)) end))
    # |> IO.inspect()
    |> Enum.map(& Task.await/1)
    |> List.foldl(%{}, fn map, acc -> Map.merge(map, acc, fn _k, v1, v2 -> v1 + v2 end) end)

    Map.merge(current_freq, frequency(Enum.slice(texts, workers..-1), workers), fn _k, v1, v2 -> v1 + v2 end)
  end

  defp get_freq(text) do
    text
    |> String.downcase()
    |> String.replace(@punctuation, "")
    |> String.codepoints()
    |> Enum.frequencies()
  end

  def sync(texts) do
    Enum.map(texts, &
    &1
    |> String.downcase()
    |> String.replace(@punctuation, "")
    |> String.codepoints()
    |> Enum.frequencies())
    |> List.foldl(%{}, fn map, acc -> Map.merge(map, acc, fn _k, v1, v2 -> v1 + v2 end) end)
  end
end

# Frequency.frequency(["ggh", "hhi"], 5) |> IO.inspect()
{microseconds, result} = :timer.tc(fn ->
  # Kod do zmierzenia
  # Frequency.frequency(List.duplicate("abbccc", 25000), 25000)
  Frequency.sync(List.duplicate("abbccc", 25000))
end)

IO.puts "Wykonanie zajęło: #{microseconds / 1_000_000} sekund"

# Frequency.frequency(List.duplicate("abbccc", 5000), 5) |> IO.inspect(label: "async")
# Frequency.sync(List.duplicate("abbccc", 5000)) |> IO.inspect(label: "sync")
