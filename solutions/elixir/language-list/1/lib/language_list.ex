defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list) do 
    [_ | new_list] = list
    new_list
  end

  def first(list) do
    [first | _] = list
    first
  end

  def count(list) do
    list
    |> length
  end

  def functional_list?(list), do: "Elixir" in list
end
