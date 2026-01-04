defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      # Words that start with a vowel, xr, or yt
      Regex.match?(~r/^([aeiou]|xr|yt)/i, word) ->
        word <> "ay"

      # Words that start with consonant(s) + qu
      captures = Regex.run(~r/^([^aeiou]*qu)(.*)$/i, word) ->
        [_full, cons_qu, rest] = captures
        rest <> cons_qu <> "ay"

      # Words that start with y (treated as consonat)
      captures = Regex.run(~r/^([yY])(.*)$/, word) ->
        [_full, y, rest] = captures
        rest <> y <> "ay"

      # Words where y acts as a vowel after consonants
      captures = Regex.run(~r/^([^aeiouy]*)([yY].*)$/, word) ->
        [_full, cons, rest] = captures
        rest <> cons <> "ay"

      # Words that start with consonant(s)
      captures = Regex.run(~r/^([^aeiou]+)(.*)/i, word) ->
        [_full, cons, rest] = captures
        rest <> cons <> "ay"

      true ->
        word
    end
  end

  # @vowels ~c"aeiou"

  # @spec translate(phrase :: String.t()) :: String.t()
  # def translate(phrase) do
  #   phrase
  #   |> String.split()
  #   |> Enum.map(&translate_word(String.to_charlist(&1)))
  #   |> Enum.join(" ")
  # end

  # defp translate_word(word) do
  #   word
  #   |> check_rule()
  #   |> case do
  #     :one -> rule(word, :one)
  #     :not_one -> rule(word, :not_one)
  #     nil -> word
  #   end
  #   |> List.to_string()
  # end

  # defp check_rule([first, second | _tail]) do
  #   cond do
  #     first in @vowels or (first == ?x and second == ?r) or (first == ?y and second == ?t) -> :one
  #     first not in @vowels -> :not_one
  #     true -> nil
  #   end
  # end

  # defp rule(phrase, :one) do
  #   phrase ++ "ay"
  # end

  # defp rule([first, second | _tail] = phrase, :not_one, first_letter \\ true) do
  #   cond do
  #     first == ?q and second == ?u -> (phrase -- [first, second]) ++ [first, second] ++ "ay"
  #     first == ?y and not first_letter -> phrase ++ "ay"
  #     first not in @vowels -> rule((phrase -- [first]) ++ [first], :not_one, false)
  #     true -> phrase ++ "ay"
  #   end
  # end
end


# IO.inspect(PigLatin.translate("apple"))
# IO.inspect(PigLatin.translate("xray"))
# IO.inspect(PigLatin.translate("yttria"))
# IO.inspect(PigLatin.translate("pig"))
# IO.inspect(PigLatin.translate("chair"))
# IO.inspect(PigLatin.translate("thrush"))
# IO.inspect(PigLatin.translate("quick"))
# IO.inspect(PigLatin.translate("square"))
# IO.inspect(PigLatin.translate("my"))
# IO.inspect(PigLatin.translate("rhythm"))
# IO.inspect(PigLatin.translate("yellow"))
# IO.inspect(PigLatin.translate("quick fast run"))

"appleay" = PigLatin.translate("apple")
"xrayay" = PigLatin.translate("xray")
"yttriaay" = PigLatin.translate("yttria")
"igpay" = PigLatin.translate("pig")
"airchay" = PigLatin.translate("chair")
"ushthray" = PigLatin.translate("thrush")
"ickquay" = PigLatin.translate("quick")
"aresquay" = PigLatin.translate("square")
"ymay" = PigLatin.translate("my")
"ythmrhay" = PigLatin.translate("rhythm")
"ellowyay" = PigLatin.translate("yellow")
"ickquay astfay unray" = PigLatin.translate("quick fast run")
