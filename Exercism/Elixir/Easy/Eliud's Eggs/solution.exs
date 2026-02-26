defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0
  def egg_count(1), do: 1
  def egg_count(number) do
    Integer.mod(number, 2) + egg_count(div(number, 2))
  end
end



IO.inspect(EliudsEggs.egg_count(0)) # 0
IO.inspect(EliudsEggs.egg_count(1)) # 1
IO.inspect(EliudsEggs.egg_count(2)) # 1
IO.inspect(EliudsEggs.egg_count(3)) # 2
IO.inspect(EliudsEggs.egg_count(4)) # 1
IO.inspect(EliudsEggs.egg_count(5)) # 2
IO.inspect(EliudsEggs.egg_count(6)) # 2
IO.inspect(EliudsEggs.egg_count(7)) # 3
IO.inspect(EliudsEggs.egg_count(8)) # 1
IO.inspect(EliudsEggs.egg_count(9)) # 2
IO.inspect(EliudsEggs.egg_count(10)) # 2
IO.inspect(EliudsEggs.egg_count(23)) # 4
