defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name, score \\ 0), do: Map.update(scores, name, score, fn _x -> 0 end)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: Map.update(scores, name, 0, fn _ -> 0 end)

  def update_score(scores, name, score) when map_size(scores) == 0, do: add_player(%{}, name, score)
  def update_score(scores, name, score) do
    {_, new_score} = Map.get_and_update(scores, name, fn x -> {x, x + score} end)
    new_score
  end

  def get_players(scores), do: scores |> Enum.map(fn {player, _} -> player end)
end
