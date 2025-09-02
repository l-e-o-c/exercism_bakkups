defmodule LibraryFees do
  def datetime_from_string(string) do
    string
    |> NaiveDateTime.from_iso8601!()
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date()
    |> then(fn date ->
      if before_noon?(checkout_datetime) do
        Date.add(date, 28)
      else
        Date.add(date, 29)
      end
    end)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> then(fn days ->
      if days < 0, do: 0, else: days
    end)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> then(fn day ->
      day == 1
    end)
  end

  def calculate_late_fee(checkout, return, rate) do
    actual_return_date =
      return
      |> datetime_from_string()

    checkout
    |> datetime_from_string()
    |> return_date()
    |> days_late(actual_return_date)
    |> then(fn late_days ->
      if monday?(actual_return_date) do
        (late_days * rate / 2)
        |> floor()
      else
        late_days * rate
      end
    end)
  end
end
