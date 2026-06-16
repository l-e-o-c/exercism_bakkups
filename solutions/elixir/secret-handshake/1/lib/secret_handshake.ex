defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code < 32, do: commands(code, [])
  def commands(_code), do: []
  defp commands(0, acc), do: acc
  defp commands(code, acc) when Bitwise.band(code, 1) == 1, do: commands(code - 1, acc ++ ["wink"])
  defp commands(code, acc) when Bitwise.band(code, 2) == 2, do: commands(code - 2, acc ++ ["double blink"])
  defp commands(code, acc) when Bitwise.band(code, 4) == 4, do: commands(code - 4, acc ++ ["close your eyes"])
  defp commands(code, acc) when Bitwise.band(code, 8) == 8, do: commands(code - 8, acc ++ ["jump"])
  defp commands(code, acc) when Bitwise.band(code, 16) == 16, do: commands(code - 16, Enum.reverse(acc))
end
