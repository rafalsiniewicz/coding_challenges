defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(_volume_pair = {:cup, numeric_volume}) do
    {:milliliter, numeric_volume * 240}
  end

  def to_milliliter(_volume_pair = {:fluid_ounce, numeric_volume}) do
    {:milliliter, numeric_volume * 30}
  end

  def to_milliliter(_volume_pair = {:teaspoon, numeric_volume}) do
    {:milliliter, numeric_volume * 5}
  end

  def to_milliliter(_volume_pair = {:tablespoon, numeric_volume}) do
    {:milliliter, numeric_volume * 15}
  end

  def to_milliliter(_volume_pair = {:milliliter, numeric_volume}) do
    {:milliliter, numeric_volume}
  end

  def from_milliliter(_volume_pair = {:milliliter, numeric_volume}, unit = :cup) do
    {unit, numeric_volume / 240}
  end

  def from_milliliter(_volume_pair = {:milliliter, numeric_volume}, unit = :fluid_ounce) do
    {unit, numeric_volume / 30}
  end

  def from_milliliter(_volume_pair = {:milliliter, numeric_volume}, unit = :teaspoon) do
    {unit, numeric_volume / 5}
  end

  def from_milliliter(_volume_pair = {:milliliter, numeric_volume}, unit = :tablespoon) do
    {unit, numeric_volume / 15}
  end

  def from_milliliter(_volume_pair = {:milliliter, numeric_volume}, unit = :milliliter) do
    {unit, numeric_volume}
  end

  def convert(volume_pair = {:milliliter, _numeric_volume}, unit) do
    from_milliliter(volume_pair, unit)
  end

  def convert(volume_pair = {_, _}, _unit = :milliliter) do
    to_milliliter(volume_pair)
  end

  def convert(_volume_pair = {:cup, numeric_volume}, unit = :cup) do
    {unit, numeric_volume}
  end

  def convert(_volume_pair = {:cup, numeric_volume}, unit = :fluid_ounce) do
    {unit, numeric_volume * 8}
  end

  def convert(_volume_pair = {:cup, numeric_volume}, unit = :teaspoon) do
    {unit, numeric_volume * 48}
  end

  def convert(_volume_pair = {:cup, numeric_volume}, unit = :tablespoon) do
    {unit, numeric_volume * 16}
  end

  def convert(_volume_pair = {:fluid_ounce, numeric_volume}, unit = :cup) do
    {unit, numeric_volume / 8}
  end

  def convert(_volume_pair = {:fluid_ounce, numeric_volume}, unit = :fluid_ounce) do
    {unit, numeric_volume}
  end

  def convert(_volume_pair = {:fluid_ounce, numeric_volume}, unit = :teaspoon) do
    {unit, numeric_volume * 6}
  end

  def convert(_volume_pair = {:fluid_ounce, numeric_volume}, unit = :tablespoon) do
    {unit, numeric_volume * 2}
  end

  def convert(_volume_pair = {:teaspoon, numeric_volume}, unit = :cup) do
    {unit, numeric_volume / 48}
  end

  def convert(_volume_pair = {:teaspoon, numeric_volume}, unit = :fluid_ounce) do
    {unit, numeric_volume / 6}
  end

  def convert(_volume_pair = {:teaspoon, numeric_volume}, unit = :teaspoon) do
    {unit, numeric_volume}
  end

  def convert(_volume_pair = {:teaspoon, numeric_volume}, unit = :tablespoon) do
    {unit, numeric_volume / 3}
  end

  def convert(_volume_pair = {:tablespoon, numeric_volume}, unit = :cup) do
    {unit, numeric_volume / 16}
  end

  def convert(_volume_pair = {:tablespoon, numeric_volume}, unit = :fluid_ounce) do
    {unit, numeric_volume / 2}
  end

  def convert(_volume_pair = {:tablespoon, numeric_volume}, unit = :teaspoon) do
    {unit, numeric_volume * 3}
  end

  def convert(_volume_pair = {:tablespoon, numeric_volume}, unit = :tablespoon) do
    {unit, numeric_volume}
  end

end


IO.puts(KitchenCalculator.get_volume({:cup, 2.0}))
to_mil = KitchenCalculator.to_milliliter({:cup, 2.5})
IO.puts("#{elem(to_mil, 0)} #{elem(to_mil, 1)}")
from_mil = KitchenCalculator.from_milliliter({:milliliter, 1320.0}, :cup)
IO.puts("#{elem(from_mil, 0)} #{elem(from_mil, 1)}")
conv = KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
IO.puts("#{elem(conv, 0)} #{elem(conv, 1)}")
