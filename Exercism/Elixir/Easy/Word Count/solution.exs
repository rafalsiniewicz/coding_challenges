defmodule WordCount do
  @contractions [" ", "\n", "\t", ":", ",", ".", "/", "\\", ";", "!", "\"", "&", "@", "$", "%", "^", "&", "_"]

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(@contractions, trim: true)
    |> Enum.frequencies_by(&clear_word/1)
  end

  defp clear_word(word) do
    word
    |> String.downcase()
    |> String.trim("'")
    |> String.replace(@contractions, "")
  end
end

# WordCount.count("\"That's the password: 'PASSWORD 123'!\", cried the Special Agent.\nSo I fled.") |> IO.inspect()
WordCount.count("car : carpet as java : javascript!!&@$%^&") |> IO.inspect()
