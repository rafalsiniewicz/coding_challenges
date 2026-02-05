defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  # @spec search(tuple, integer) :: {:ok, integer} | :not_found
  # def search(numbers, key) do
  #   numbers
  #   |> Tuple.to_list()
  #   |> Enum.find_index(& &1 == key)
  #   |> case do
  #     nil -> :not_found
  #     value -> {:ok, value}
  #   end
  # end

  # @spec search(tuple, integer) :: {:ok, integer} | :not_found
  # def search(numbers, key) do
  #   numbers
  #   |> Tuple.to_list()
  #   |> do_search(key, 0)
  # end

  # defp do_search([], _key, _index), do: :not_found
  # defp do_search([number], key, index) when key == number, do: {:ok, index}
  # defp do_search([_number], _key, _index), do: :not_found

  # defp do_search(numbers, key, index) do
  #   IO.inspect({numbers, key, index}, charlists: :as_lists)
  #   middle_index = div(length(numbers), 2)
  #   middle_value = Enum.at(numbers, middle_index)
  #   cond do
  #     middle_value == key -> {:ok, index + middle_index}
  #     key > middle_value -> do_search(Enum.slice(numbers, middle_index+1..length(numbers)-1), key, index + middle_index + 1)
  #     true -> do_search(Enum.slice(numbers, 0..middle_index-1), key, index)
  #   end
  # end

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers))
  end

  defp search(numbers, key, min, max) when min == max and elem(numbers, min) == key, do: {:ok, min}
  defp search(_numbers, _key, min, max) when min == max, do: :not_found
  defp search(numbers, key, min, max) do
    middle_index = div(max - min, 2) + min
    middle_value = elem(numbers, middle_index)
    # IO.inspect({min, max, middle_index, middle_value})
    cond do
      middle_value == key -> {:ok, middle_index}
      middle_value > key -> search(numbers, key, min, middle_index - 1)
      true -> search(numbers, key, middle_index + 1, max)
    end
  end
end

# IO.inspect(BinarySearch.search({}, 2))
# IO.inspect(BinarySearch.search({1, 3, 5}, 2))
# IO.inspect(BinarySearch.search({1, 3, 5}, 5))
# IO.inspect(BinarySearch.search({6}, 6))
# IO.inspect(BinarySearch.search({1, 2, 4, 5, 6}, 4))
IO.inspect(BinarySearch.search({1, 3, 4, 5, 8, 9, 11}, 1))




# IO.inspect(BinarySearch.search({6}, 6)) # == {:ok, 0}
# IO.inspect(BinarySearch.search({3}, 3)) # == {:ok, 0}



# IO.inspect(BinarySearch.search({1, 2, 4, 5, 6}, 4)) # == {:ok, 2}
# IO.inspect(BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 6)) # == {:ok, 3}



# IO.inspect(BinarySearch.search({1, 2, 4, 5, 6}, 1)) # == {:ok, 0}
# IO.inspect(BinarySearch.search({1, 3, 4, 5, 8, 9, 11}, 1)) # == {:ok, 0}



# IO.inspect(BinarySearch.search({1, 2, 4, 5, 6}, 6)) # == {:ok, 4}
# IO.inspect(BinarySearch.search({1, 3, 4, 5, 8, 9, 11}, 11)) # == {:ok, 6}



# tuple = {1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634}
# IO.inspect(BinarySearch.search(tuple, 144)) # == {:ok, 9}



# tuple = {1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377}
# IO.inspect(BinarySearch.search(tuple, 21)) # == {:ok, 5}
# IO.inspect(BinarySearch.search(tuple, 34)) # == {:ok, 6}



# IO.inspect(BinarySearch.search({2, 4, 6}, 3)) # == :not_found
# IO.inspect(BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 7)) # == :not_found



# IO.inspect(BinarySearch.search({2, 4, 6}, 1)) # == :not_found
# IO.inspect(BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 0)) # == :not_found



# IO.inspect(BinarySearch.search({2, 4, 6}, 9)) # == :not_found
# IO.inspect(BinarySearch.search({1, 3, 4, 6, 8, 9, 11}, 13)) # == :not_found



# IO.inspect(BinarySearch.search({}, 1)) # == :not_found

# IO.inspect(BinarySearch.search({1, 2}, 0)) # == :not_found
