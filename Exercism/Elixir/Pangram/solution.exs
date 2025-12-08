defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  # @all_letters_charlist ~c"abcdefghijklmnopqrstuvwxyz"
  @all_letters_charlist ?a..?z

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence = sentence
    |> String.downcase()
    |> String.to_charlist()

    Enum.all?(@all_letters_charlist, & &1 in sentence)
  end

  # @spec pangram?(String.t()) :: boolean
  # def pangram?(sentence) do
  #   sentence_charlist =
  #     sentence
  #     |> String.downcase()
  #     |> String.replace(~r/(\s|[^a-z])/, "")
  #     |> String.to_charlist()
  #     |> Enum.uniq()
  #     |> Enum.sort()
  #   Enum.reduce_while(@all_letters_charlist, true, fn letter, acc ->
  #     if Enum.find(sentence_charlist, & &1 == letter) do
  #       {:cont, acc}
  #     else
  #       {:halt, false}
  #     end
  #   end)
  # end

  # @spec pangram?(String.t()) :: boolean
  # def pangram?(sentence) do
  #   sentence
  #   |> String.downcase()
  #   |> String.replace(~r/(\s|[^a-z])/, "")
  #   |> String.to_charlist()
  #   |> Enum.uniq()
  #   |> Enum.sort()
  #   |> then(& &1 == @all_letters_charlist)
  # end
end


# IO.inspect(Pangram.pangram?("the quick brown fox jumps over the lazy dog"))
IO.inspect(Pangram.pangram?("\"Five quacking Zephyrs jolt my wax bed.\""))
# IO.inspect(Enum.uniq(String.to_charlist("sadfasdfasdf")))
