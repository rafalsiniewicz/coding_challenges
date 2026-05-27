# defmodule Spiral do
#   @doc """
#   Given the dimension, return a square matrix of numbers in clockwise spiral order.
#   """
#   @spec matrix(dimension :: integer) :: list(list(integer))
#   def matrix(0), do: []
#   def matrix(dimension) do
#     matrix = for _ <- 1..dimension do
#       for _ <- 1..dimension do
#         1
#       end
#     end
#     Enum.reduce(1..dimension*dimension, {matrix, {0, 0}, 0}, fn n, {result, {x,y}, cycle_cnt} ->
#       # IO.inspect({result, {x,y}, dir, cycle_cnt})
#       row = Enum.at(result, y)
#       new_row = List.replace_at(row, x, n)
#       {next_dir, cycle_cnt} = cond do
#         y > cycle_cnt + 1 and x == cycle_cnt -> {:u, cycle_cnt}
#         y == dimension - 1 - cycle_cnt -> {:l, cycle_cnt}
#         x == dimension - 1 - cycle_cnt -> {:d, cycle_cnt}
#         y == cycle_cnt + 1 -> {:r, cycle_cnt + 1}
#         true -> {:r, cycle_cnt}
#       end
#       {List.replace_at(result, y, new_row), get_coordinates(x, y, next_dir), cycle_cnt}
#     end)
#     |> then(& elem(&1, 0))
#   end

#   defp get_coordinates(x, y, next_dir) do
#     case next_dir do
#       :r -> {x+1, y}
#       :d -> {x, y+1}
#       :l -> {x-1, y}
#       :u -> {x,y-1}
#     end
#   end
# end

# Spiral.matrix(5) |> IO.inspect()
# Spiral.matrix(4) |> IO.inspect()
# Spiral.matrix(3) |> IO.inspect()
# Spiral.matrix(1) |> IO.inspect()
# Spiral.matrix(13) |> IO.inspect()


defmodule Spiral do
  @doc """
  Given the dimension, return a square matrix of numbers in clockwise spiral order.
  """
  @spec matrix(dimension :: integer) :: list(list(integer))
  def matrix(0), do: []

  def matrix(dimension) do
    do_matrix(dimension, dimension, 1)
  end

  defp do_matrix(_row, 0, _start), do: [[]]

  defp do_matrix(row, col, start) do
    IO.inspect({row, col, start}, label: "rcs")
    [
      start..(start + col - 1) |> Enum.to_list() |
      do_matrix(col, row - 1, start + col) |> rotate_right
    ]
  end

  defp rotate_right(matrix) do
    matrix
    |> IO.inspect(label: "matrix", charlists: :as_lists)
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.reverse/1)
    |> IO.inspect(label: "rr", charlists: :as_lists)
  end
end

Spiral.matrix(3) |> IO.inspect()
