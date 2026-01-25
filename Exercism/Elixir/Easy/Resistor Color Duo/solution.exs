defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """

  @color_value_map %{black: 0,
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

  @spec value(colors :: [atom]) :: integer
  def value(_colors = []) do
    -1
  end

  def value(_colors = [color1]) do
    @color_value_map[color1]
  end

  def value(_colors = [color1, color2 | _]) do
    10 * @color_value_map[color1] + @color_value_map[color2]
  end
end


IO.inspect(ResistorColorDuo.value([:brown, :green]))
IO.inspect(ResistorColorDuo.value([:brown, :green, :violet]))
