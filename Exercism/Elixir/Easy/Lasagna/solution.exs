defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven() do
    40
  end

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(time) do
    expected_minutes_in_oven() - time
  end

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(layers) do
    2 * layers
  end

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(layers, time) do
    expected_minutes_in_oven() - remaining_minutes_in_oven(time) + preparation_time_in_minutes(layers)
  end

  # Please define the 'alarm/0' function
  def alarm() do
    "Ding!"
  end
end

IO.puts Lasagna.expected_minutes_in_oven()
IO.puts Lasagna.remaining_minutes_in_oven(20)
IO.puts Lasagna.preparation_time_in_minutes(3)
IO.puts Lasagna.total_time_in_minutes(2, 20)
IO.puts Lasagna.alarm()