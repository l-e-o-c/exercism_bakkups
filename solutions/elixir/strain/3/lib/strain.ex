defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: keep(list, fun, [])
  defp keep([], _fun, acc), do: acc
  defp keep([head | tail], fun, acc) do
    cond do
      fun.(head) -> keep(tail, fun, acc ++ [head])
        true -> keep(tail, fun, acc)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: discard(list, fun, [])
  defp discard([], _fun, acc), do: acc
  defp discard([head | tail], fun, acc) do
    cond do
      fun.(head) -> discard(tail, fun, acc)
        true -> discard(tail, fun, acc ++ [head])
    end
  end
end
