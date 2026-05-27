defmodule KillerSudokuHelper do
  @doc """
  Return the possible combinations of `size` distinct numbers from 1-9 excluding `exclude` that sum up to `sum`.
  """
  @spec combinations(cage :: %{exclude: [integer], size: integer, sum: integer}) :: [[integer]]
  def combinations(cage) do
    do_combination([], 1, 1, cage.size)
    |> List.flatten()
    |> Enum.map( & Tuple.to_list/1)
    |> Enum.filter(& exclude(&1, cage.exclude) and Enum.sum(&1) == cage.sum)
  end

  defp do_combination(list, _iter, n, size) when n == size do
    for j <- (List.last(list) || 0)+1..9 do
      List.to_tuple(list ++ [j])
    end
  end

  defp do_combination(list, iter, n, size) do
    for i <- iter..9 do
      do_combination(list ++ [i], i+1, n+1, size)
    end
  end

  defp exclude(list, exclude) do
    Enum.all?(list, & &1 not in exclude)
  end

end

KillerSudokuHelper.combinations(%{size: 3, exclude: [1,3], sum: 11}) |> IO.inspect(limit: :infinity, printable_limit: :infinity)
KillerSudokuHelper.combinations(%{exclude: [], size: 1, sum: 1}) |> IO.inspect(limit: :infinity, printable_limit: :infinity)
KillerSudokuHelper.combinations(%{exclude: [], size: 1, sum: 2}) |> IO.inspect(limit: :infinity, printable_limit: :infinity)

# for i <- 1..9 do
#   for j <- 2..9 do
#     j
#   end
# end
