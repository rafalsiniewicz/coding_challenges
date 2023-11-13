defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    bef_noon = before_noon?(checkout_datetime)
    cond do
      bef_noon == true -> NaiveDateTime.to_date(checkout_datetime) |> Date.add(28)
      bef_noon == false -> NaiveDateTime.to_date(checkout_datetime) |> Date.add(29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff_date = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    if diff_date <= 0 do
      0
    else
      diff_date
    end
  end

  def monday?(datetime) do
    datetime.calendar.day_of_week(datetime.year, datetime.month, datetime.day) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    if return |> datetime_from_string |> monday? do
      Kernel.trunc(days_late(return_date(datetime_from_string(checkout)), datetime_from_string(return)) * 0.5 * rate)
    else
      Kernel.trunc(days_late(return_date(datetime_from_string(checkout)), datetime_from_string(return)) * rate)
    end
  end
end

# 1
~N[2021-01-01 13:30:45] = LibraryFees.datetime_from_string("2021-01-01T13:30:45Z")

# 2
true = LibraryFees.before_noon?(~N[2021-01-12 08:23:03])
true = LibraryFees.before_noon?(~N[2021-01-12 11:59:59])
false = LibraryFees.before_noon?(~N[2021-01-12 12:00:00])
false = LibraryFees.before_noon?(~N[2021-01-12 12:00:01])

# 3
~D[2020-12-27] = LibraryFees.return_date(~N[2020-11-28 15:55:33])

# 4
7 = LibraryFees.days_late(~D[2020-12-27], ~N[2021-01-03 09:23:36])

# 5
false = LibraryFees.monday?(~N[2021-01-03 13:30:45Z])

# 6
# Sunday, 7 days late
700 = LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-03T13:30:45Z", 100)
# =>

# one day later, Monday, 8 days late
400 = LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-04T09:02:11Z", 100)
