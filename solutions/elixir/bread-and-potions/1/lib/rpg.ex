defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  # Add code to define the protocol and its implementations below here...
  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: RPG.LoafOfBread do
    def eat(%RPG.LoafOfBread{}, %RPG.Character{health: health, mana: mana}) do
      {nil, %RPG.Character{health: health + 5, mana: mana}}
    end
  end

  defimpl Edible, for: RPG.ManaPotion do
    def eat(%RPG.ManaPotion{strength: strength}, %RPG.Character{health: health, mana: mana}) do
      {%RPG.EmptyBottle{}, %RPG.Character{health: health, mana: mana + strength}}
    end
  end

  defimpl Edible, for: RPG.Poison do
    def eat(%RPG.Poison{}, %RPG.Character{health: _health, mana: mana}) do
      {%RPG.EmptyBottle{}, %RPG.Character{health: 0, mana: mana}}
    end
  end
end
