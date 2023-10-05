defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    trunc(Float.ceil(apply_discount(22 * daily_rate(hourly_rate), discount)))
    # trunc(apply_discount(22 * daily_rate(hourly_rate), discount)) + 1
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end


IO.inspect(FreelancerRates.daily_rate(60))
IO.inspect(FreelancerRates.apply_discount(150, 10))
IO.inspect(FreelancerRates.monthly_rate(77, 10.5))
IO.inspect(FreelancerRates.days_in_budget(20000, 80, 11.0))
