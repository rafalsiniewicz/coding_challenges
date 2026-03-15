defmodule MatchingBrackets do
  @brackets "[]"
  @braces "{}"
  @parentheses "()"

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints()
    |> Enum.reduce("", fn cp, acc ->
      if String.contains?(@brackets <> @braces <> @parentheses, cp) do
        acc <> cp
      else
        acc
      end
    end)
    |> remove_brackets()
  end

  defp remove_brackets(""), do: true

  defp remove_brackets(str) do
    str_removed = String.replace(str, [@brackets, @braces, @parentheses], "")
    if str_removed == str do
      false
    else
      remove_brackets(str_removed)
    end
  end
end

IO.inspect(MatchingBrackets.check_brackets("{what is (42)}?"))
IO.inspect(MatchingBrackets.check_brackets("[text}"))
