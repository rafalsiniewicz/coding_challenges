defmodule TwelveDays do
  @days_names %{
    1 => ["first", "a Partridge in a Pear Tree."],
    2 => ["second", "two Turtle Doves"],
    3 => ["third", "three French Hens"],
    4 => ["fourth", "four Calling Birds"],
    5 => ["fifth", "five Gold Rings"],
    6 => ["sixth", "six Geese-a-Laying"],
    7 => ["seventh", "seven Swans-a-Swimming"],
    8 => ["eighth", "eight Maids-a-Milking"],
    9 => ["ninth", "nine Ladies Dancing"],
    10 => ["tenth", "ten Lords-a-Leaping"],
    11 => ["eleventh", "eleven Pipers Piping"],
    12 => ["twelfth",  "twelve Drummers Drumming"]
  }

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{List.first(@days_names[number])} day of Christmas my true love gave to me: " <> verse_gifts(number)
  end

  defp verse_gifts(0), do: ""

  defp verse_gifts(number) do
    List.last(@days_names[number]) <> "#{maybe_comma(number)}#{maybe_and(number)}" <> verse_gifts(number - 1)
  end

  defp maybe_comma(number) when number > 1, do: ", "
  defp maybe_comma(_number), do: ""
  defp maybe_and(number) when number == 2, do: "and "
  defp maybe_and(_number), do: ""
  defp maybe_newline(true), do: "\n"
  defp maybe_newline(_), do: ""

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    do_verses(starting_verse, ending_verse)
  end

  defp do_verses(starting_verse, ending_verse) when starting_verse > ending_verse, do: ""

  defp do_verses(starting_verse, ending_verse) do
    verse(starting_verse) <> "#{maybe_newline(starting_verse != ending_verse)}" <> do_verses(starting_verse + 1, ending_verse)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1,12)
  end
end


# for i <- 1..12 do
#   TwelveDays.verse(i) |> IO.inspect()
# end


# TwelveDays.verses(3, 5) |> IO.inspect()
TwelveDays.sing() |> IO.inspect()
