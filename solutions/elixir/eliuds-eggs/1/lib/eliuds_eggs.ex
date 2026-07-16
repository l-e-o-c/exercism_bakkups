defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number), do: egg_count(Integer.digits(number, 2), 0)

  defp egg_count([], acc), do: acc
  defp egg_count([1 | tail], acc), do: egg_count(tail, acc + 1)
  defp egg_count([0 | tail], acc), do: egg_count(tail, acc)
end
