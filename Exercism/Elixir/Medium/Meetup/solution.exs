defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
          :monday
          | :tuesday
          | :wednesday
          | :thursday
          | :friday
          | :saturday
          | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @weekdays %{
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: Date.t()
  def meetup(year, month, weekday, schedule) do
    year
    |> generate_month(month)
    |> Enum.filter(& elem(&1, 1) == @weekdays[weekday])
    |> get_scheduled(schedule)
  end

  defp generate_month(year, month) do
    first_day = year |> Date.new!(month, 1)

    days_in_month =
    first_day
    |> Date.days_in_month()

    0..days_in_month-1
    |> Enum.map(& {Date.add(first_day, &1), Date.add(first_day, &1) |> Date.day_of_week()})
  end

  defp get_scheduled(dates, schedule) do
    case schedule do
      :first -> List.first(dates)
      :second -> Enum.at(dates, 1)
      :third -> Enum.at(dates, 2)
      :fourth -> Enum.at(dates, 3)
      :last -> List.last(dates)
      :teenth -> Enum.find(dates, & (Date.to_string(elem(&1, 0)) |> String.split("-") |> List.last() |> String.to_integer()) in 13..19)
    end
    |> elem(0)
  end
end


Meetup.meetup(2013, 5, :monday, :teenth) |> IO.inspect()
