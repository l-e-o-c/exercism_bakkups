defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(&(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &Map.put(&1, :name, String.replace(&1.name, old_word, new_word)))
  end

  def increase_quantity(item, count) do
    Map.put(item, :quantity_by_size, Enum.into(item.quantity_by_size,%{}, fn {k, v} -> {k, v + count} end))
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_k, v}, acc -> acc + v end)
  end
end
