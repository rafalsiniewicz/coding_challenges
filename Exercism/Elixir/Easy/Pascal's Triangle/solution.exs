defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(1), do: [[1]]
  def rows(2), do: rows(1) ++ [[1, 1]]

  def rows(num) do
    previous = Enum.at(rows(num - 1), num - 2)
    middle = for i <- 1..(num-2) do
      Enum.at(previous, i-1) + Enum.at(previous, i)
    end
    rows(num - 1) ++ [[1] ++ middle ++ [1]]
  end
end


IO.inspect(PascalsTriangle.rows(3))
IO.inspect(PascalsTriangle.rows(4))
IO.inspect(PascalsTriangle.rows(5))
IO.inspect(PascalsTriangle.rows(15))
