defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card), do: MapSet.new([card])

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    new_collection = [card]
    |> MapSet.new
    |> MapSet.union(collection)

    {MapSet.member?(collection, card), new_collection}
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    trade_possible = MapSet.member?(collection, your_card) and not MapSet.member?(collection, their_card)

    new_collection = collection
    |> MapSet.difference(MapSet.new([your_card]))
    |> MapSet.union(MapSet.new([their_card]))

    {trade_possible, new_collection}
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    cards
    |> Enum.uniq()
    |> Enum.sort()
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    your_collection
    |> MapSet.difference(their_collection)
    |> MapSet.size()
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards([]), do: []
  def boring_cards(collections) do
    collections
    |> Enum.reduce(fn collection, acc -> MapSet.intersection(acc, collection) end)
    |> MapSet.to_list()
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards([]), do: 0
  def total_cards(collections) do
    collections
    |> Enum.reduce(fn collection, acc -> MapSet.union(acc, collection) end)
    |>MapSet.size()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    collection
    |> MapSet.split_with(fn card -> String.starts_with?(card, "Shiny") end)
    |> then(fn {a, b} -> {MapSet.to_list(a), MapSet.to_list(b)} end)
  end
end
