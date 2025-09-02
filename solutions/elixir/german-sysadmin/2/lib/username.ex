defmodule Username do
  def sanitize(username), do: sanitize(username, [])

  defp sanitize([], sanitized), do: sanitized
  defp sanitize([head | tail], sanitized) do
    case head do
      ?_ -> sanitize(tail, sanitized ++ [head])
      ?ä -> sanitize(tail, sanitized ++ [?a, ?e])
      ?ö -> sanitize(tail, sanitized ++ [?o, ?e])
      ?ü -> sanitize(tail, sanitized ++ [?u, ?e])
      ?ß -> sanitize(tail, sanitized ++ [?s, ?s])
      head when head < 97 -> sanitize(tail, sanitized)
      head when head < 123 -> sanitize(tail, sanitized ++ [head])
      _ -> sanitize(tail, sanitized)
    end
  end
end
