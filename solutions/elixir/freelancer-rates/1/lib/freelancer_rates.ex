defmodule FreelancerRates do
  @hours 8
  @billable_days_in_month 22

  def daily_rate(hourly_rate) do
    @hours * hourly_rate * 1.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100 - discount) / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    before_discount = daily_rate(hourly_rate) * @billable_days_in_month
    apply_discount(before_discount, discount) |> Float.ceil() |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_cost = daily_rate(hourly_rate) |> apply_discount(discount)
    (budget / daily_cost) |> Float.floor(1)
  end
end
