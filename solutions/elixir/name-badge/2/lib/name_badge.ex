defmodule NameBadge do
  def print(id, name, department) do
    if id do
      "[#{id}] - #{name} -"
    else
      "#{name} -"
    end
    |> then(fn x ->
      if department,
        do: "#{x} #{department |> String.upcase()}",
        else: "#{x} OWNER"
    end)
  end
end
