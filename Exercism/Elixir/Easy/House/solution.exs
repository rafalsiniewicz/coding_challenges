defmodule House do
  @nouns [
    "house that Jack built",
    "malt",
    "rat",
    "cat",
    "dog",
    "cow with the crumpled horn",
    "maiden all forlorn",
    "man all tattered and torn",
    "priest all shaven and shorn",
    "rooster that crowed in the morn",
    "farmer sowing his corn",
    "horse and the hound and the horn"
  ]

  @verbs [
    "lay in ",
    "ate ",
    "killed ",
    "worried ",
    "tossed ",
    "milked ",
    "kissed ",
    "married ",
    "woke ",
    "kept ",
    "belonged to "
  ]

  @doc """
  Return verses of the nursery rhyme 'This is the House that Jack Built'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    start..stop
    |> Enum.map(& do_recite(&1, &1))
    |> Enum.join()
  end

  defp do_recite(_start, 0), do: ".\n"
  defp do_recite(start, start), do: "This is the " <> Enum.at(@nouns, start - 1) <> maybe_space(start) <> do_recite(start, start - 1)
  defp do_recite(start, cnt) do
    "that " <> Enum.at(@verbs, cnt - 1) <> "the " <> Enum.at(@nouns, cnt - 1) <> maybe_space(cnt) <> do_recite(start, cnt - 1)
  end

  defp maybe_space(1), do: ""
  defp maybe_space(_cnt), do: " "
end


# IO.inspect(House.recite(1, 1))
# IO.inspect(House.recite(2, 2))
# IO.inspect(House.recite(3, 3))
# IO.inspect(House.recite(4, 4))
# IO.inspect(House.recite(5, 5))
# IO.inspect(House.recite(6, 6))
# IO.inspect(House.recite(7, 7))
# IO.inspect(House.recite(8, 8))
# IO.inspect(House.recite(9, 9))
# IO.inspect(House.recite(10, 10))
# IO.inspect(House.recite(11, 11))
# IO.inspect(House.recite(12, 12))
IO.inspect(House.recite(1, 2))
