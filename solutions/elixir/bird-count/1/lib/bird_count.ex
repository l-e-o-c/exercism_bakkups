defmodule BirdCount do
  def today([]), do: nil
  def today([head | _]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head | _]) when head == 0, do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days(list), do: busy_days(0, list)
  defp busy_days(acc, []), do: acc
  defp busy_days(acc, [head | tail]) when head >= 5, do: busy_days(acc + 1, tail) 
  defp busy_days(acc, [_ | tail]), do: busy_days(acc, tail) 
end
