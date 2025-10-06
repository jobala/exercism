defmodule KitchenCalculator do
  @conversion_table %{
    :milliliter => 1,
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15
  }

  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {measurement, volume} = volume_pair
    {:milliliter, @conversion_table[measurement] * volume}
  end

  def from_milliliter(volume_pair, unit) do
    {_, volume} = volume_pair
    {unit, volume / @conversion_table[unit]}
  end

  def convert(volume_pair, unit) do
    {_, ml} = to_milliliter(volume_pair)

    {unit, ml / @conversion_table[unit]}
  end
end
