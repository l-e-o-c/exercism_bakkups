defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class(), do: Enum.fetch!(@planetary_classes, :rand.uniform(10) - 1)

  def random_ship_registry_number(), do: "NCC-#{:rand.uniform(9000) + 999}"

  def random_stardate(), do: :rand.uniform * 1000 + 41000

  def format_stardate(stardate) do
    "#{:io_lib.format("~.1f", [stardate])}"
  end
end
