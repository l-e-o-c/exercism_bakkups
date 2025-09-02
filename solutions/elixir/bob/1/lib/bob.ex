defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input
    |> String.trim()
    |> then(fn trimmed_input ->
      cond do
        String.trim(trimmed_input) == "" ->
          "Fine. Be that way!"

        trimmed_input == String.upcase(trimmed_input) and
          String.upcase(trimmed_input) != String.downcase(trimmed_input) and
            String.last(trimmed_input) == "?" ->
          "Calm down, I know what I'm doing!"

        trimmed_input == String.upcase(trimmed_input) and
            String.upcase(trimmed_input) != String.downcase(trimmed_input) ->
          "Whoa, chill out!"

        String.last(trimmed_input) == "?" ->
          "Sure."

        true ->
          "Whatever."
      end
    end)
  end
end
