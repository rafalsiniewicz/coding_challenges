defmodule BirdCount do
  def today(list) when length(list) == 0 do
    nil
  end

  def today([head | _tail]) do
    head
  end

  def increment_day_count(list) when length(list) == 0 do
    [1]
  end

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?([head | tail]) do
    cond do
      head == 0 -> true
      head > 0 and length(tail) > 0 -> has_day_without_birds?(tail)
      length(tail) == 0 -> false
    end
  end

  def total([]) do
    0
  end

  def total([head | tail]) do
    head + total(tail)
  end

  def busy_days([]) do
    0
  end

  def busy_days([head | tail]) do
    cond do
      head >= 5 -> 1 + busy_days(tail)
      true -> busy_days(tail)
    end
  end
end

IO.inspect(BirdCount.today([2, 5, 1]))
IO.inspect(BirdCount.today([]))
IO.inspect(BirdCount.increment_day_count([4, 0, 2]))
IO.inspect(BirdCount.increment_day_count([]))
IO.inspect(BirdCount.has_day_without_birds?([2, 0, 4]))
IO.inspect(BirdCount.has_day_without_birds?([3, 8, 1, 5]))
IO.inspect(BirdCount.total([4, 0, 9, 0, 5]))
IO.inspect(BirdCount.total([]))
IO.inspect(BirdCount.busy_days([4, 5, 0, 0, 6]))
IO.inspect(BirdCount.busy_days([]))
