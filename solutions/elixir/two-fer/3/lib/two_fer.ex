defmodule TwoFer do
  @moduledoc """
  This is TwoFer  module, comming from [exercism](https://exercism.org)
  """

  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.

  Returns either `One for you, one for me.` or `One for Name, one for me.`,
  where `Name` is the argument given to the `two_fer`-function.

  ## Examples

      iex> TwoFer.two_fer()
      "One for you, one for me."

      iex> TwoFer.two_fer("Alice")
      "One for Alice, one for me."
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") when is_binary(name)
    do "One for #{name}, one for me."
  end
end
