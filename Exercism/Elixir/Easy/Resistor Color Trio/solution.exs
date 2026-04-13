defmodule ResistorColorTrio do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(_colors = [first, second, third | _tail]) do
    second_value = @colors[second]
    third_value = @colors[third] + if second_value == 0, do: 1, else: 0
    {magnitude, factor} = cond do
      third_value < 3 -> {:ohms, Integer.pow(10, third_value)}
      third_value < 6 -> {:kiloohms, Integer.pow(10, third_value - 3)}
      third_value < 9 -> {:megaohms, Integer.pow(10, third_value - 6)}
      third_value == 9 -> {:gigaohms, 1}
    end
    {(@colors[first] * (if second_value == 0, do: 1, else: 10) + @colors[second]) * factor, magnitude}
  end
end

ResistorColorTrio.label([:orange, :orange, :black]) |> IO.inspect()
ResistorColorTrio.label([:orange, :orange, :red]) |> IO.inspect()
ResistorColorTrio.label([:orange, :orange, :orange]) |> IO.inspect()
ResistorColorTrio.label([:white, :black, :orange]) |> IO.inspect()
ResistorColorTrio.label([:red, :black, :red]) |> IO.inspect()
