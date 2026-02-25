defmodule BottleSong do
  @moduledoc """
  Handles lyrics of the popular children song: Ten Green Bottles
  """

  @numbers %{
    0 => "no",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten"
  }

  @spec recite(pos_integer, pos_integer) :: String.t()
  def recite(_start_bottle, _take_down = 0), do: ""

  def recite(start_bottle, take_down) do
    start_bottle_number = String.capitalize(@numbers[start_bottle])
    start_bottle_word = pluralize(start_bottle, "bottle")
    end_bottle_number = @numbers[start_bottle-1]
    end_bottle_word = pluralize(start_bottle-1, "bottle")

    "#{start_bottle_number} green #{start_bottle_word} hanging on the wall,
#{start_bottle_number} green #{start_bottle_word} hanging on the wall,
And if one green bottle should accidentally fall,
There'll be #{end_bottle_number} green #{end_bottle_word} hanging on the wall." <> if(take_down > 1, do: "\n\n", else: "") <> recite(start_bottle-1, take_down-1)
  end

  defp pluralize(1, word), do: word
  defp pluralize(_number, word), do: word <> "s"
end


IO.inspect(BottleSong.recite(10, 2))
