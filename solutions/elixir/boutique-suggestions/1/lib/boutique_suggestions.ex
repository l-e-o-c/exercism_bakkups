defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    opts = Keyword.get(options, :maximum_price, 100.00)
    for x <- tops,
        y <- bottoms,
        x.base_color != y.base_color && x.price + y.price <= opts do
      {x, y}
    end
  end
end
