defmodule GuessingGame do
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when abs(guess - secret_number) == 1, do: "So close"
  def compare(secret_number, guess) when secret_number - guess < 0, do: "Too high"
  def compare(secret_number, guess) when secret_number - guess > 0, do: "Too low"
  def compare(_, _), do: "Make a guess"
  def compare(_), do: "Make a guess"
end
