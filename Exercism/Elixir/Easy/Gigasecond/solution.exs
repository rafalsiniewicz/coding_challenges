defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    year
    |> Date.new!(month, day)
    |> DateTime.new!(hours |> Time.new!(minutes, seconds))
    |> DateTime.to_unix()
    |> Kernel.+(1_000_000_000)
    |> DateTime.from_unix!()
    |> then(& {{&1.year, &1.month, &1.day}, {&1.hour, &1.minute, &1.second}})
  end
end

IO.inspect(Gigasecond.from({{2025, 10, 12}, {12,12,12}}))
