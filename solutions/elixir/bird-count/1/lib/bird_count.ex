defmodule BirdCount do
  def today(list) do
    list |> List.first()
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?(list) do
    list
    |> Enum.filter(fn bird_count -> bird_count == 0 end)
    |> Enum.empty?()
    |> Kernel.not()
  end

  def total(list) do
    list |> Enum.sum()
  end

  def busy_days(list) do
    list |> Enum.filter(fn count -> count >= 5 end) |> Enum.count()
  end
end
