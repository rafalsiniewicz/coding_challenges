defmodule Allergies do
  @allergies ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    flags
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.slice(0..7)
    |> Enum.with_index()
    |> Enum.reduce([], fn {bit, i}, acc ->
      if bit == 1 do
        acc ++ [Enum.at(@allergies, i)]
      else
        acc
      end
    end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    flags
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.at(Enum.find_index(@allergies, & &1 == item)) == 1
  end
end

Allergies.list(34) |> IO.inspect()
Allergies.list(509) |> IO.inspect()
Allergies.allergic_to?(34, "peanuts") |> IO.inspect()
Allergies.allergic_to?(34, "eggs") |> IO.inspect()
