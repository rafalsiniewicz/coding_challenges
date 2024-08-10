defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    sorted_base = sort_word(base)
    Enum.reduce(candidates, [], fn candidate, acc ->
      if sorted_base == sort_word(candidate) and String.downcase(base) != String.downcase(candidate) do
        acc ++ [candidate]
      else
        acc
      end
    end)
  end

  defp sort_word(word) do
    List.to_string(Enum.sort(String.to_charlist(String.downcase(word))))
  end

  # @spec match(String.t(), [String.t()]) :: [String.t()]
  # def match(base, candidates) do
  #   base_downcase = String.downcase(base)
  #   base_freq = Enum.frequencies(String.to_charlist(String.downcase(base)))
  #   Enum.reduce(candidates, [], fn c, acc ->
  #     if Enum.frequencies(String.to_charlist(String.downcase(c))) == base_freq and base_downcase != String.downcase(c) do
  #       acc ++ [c]
  #     else
  #       acc
  #     end
  #   end)
  # end

  # @spec match(String.t(), [String.t()]) :: [String.t()]
  # def match(base, candidates) do
  #   base_downcase_charlist = String.to_charlist(String.downcase(base))
  #   base_downcase_charlist_length = length(base_downcase_charlist)
  #   Enum.reduce(candidates, [], fn c, acc ->
  #     c_downcase_charlist = String.to_charlist(String.downcase(c))
  #     # c_filtered_length = length(Enum.filter(c_downcase_charlist, fn x -> x in base_downcase_charlist end))
  #     {c_filtered_length, _} = Enum.reduce(c_downcase_charlist, {0, base_downcase_charlist}, fn x, {cnt, base_acc} ->
  #       if x in base_acc do
  #         {cnt + 1, List.delete(base_acc, x)}
  #       else
  #         {cnt, base_acc}
  #       end
  #     end)
  #     if c_filtered_length == base_downcase_charlist_length and c_filtered_length == length(c_downcase_charlist) and base_downcase_charlist != c_downcase_charlist do
  #       acc ++ [c]
  #     else
  #       acc
  #     end
  #   end)
  # end
end


# 1
Anagram.match("stone", ["stone", "tones", "banana", "tons", "notes", "Seton"])
|> IO.inspect()
