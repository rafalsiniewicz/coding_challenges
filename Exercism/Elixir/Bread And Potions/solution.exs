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

  @type t() :: %LoafOfBread{} | %ManaPotion{strength: integer} | %Poison{} | %EmptyBottle{}

  defprotocol Edible do
    @spec eat(RPG.t(), Character) :: {RPG.t() | nil, Character}
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(_item, character) do
      {nil, %{character | health: character.health + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(item, character) do
      {%EmptyBottle{}, %{character | mana: character.mana + item.strength}}
    end
  end

  defimpl Edible, for: Poison do
    def eat(_item, character) do
      {%EmptyBottle{}, %{character | health: 0}}
    end
  end

end

defmodule Test do
  def test() do
    # 2
    {nil, %RPG.Character{health: 36, mana: 0}} = RPG.Edible.eat(%RPG.LoafOfBread{}, %RPG.Character{health: 31})

    # 3
    {%RPG.EmptyBottle{}, %RPG.Character{health: 100, mana: 63}} = RPG.Edible.eat(%RPG.ManaPotion{strength: 13}, %RPG.Character{mana: 50})

    # 4
    {%RPG.EmptyBottle{}, %RPG.Character{health: 0, mana: 0}} = RPG.Edible.eat(%RPG.Poison{}, %RPG.Character{health: 3000})
  end
end

Test.test()
