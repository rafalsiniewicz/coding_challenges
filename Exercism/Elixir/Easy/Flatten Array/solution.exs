defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  # def flatten(list) do
  #   list |> List.flatten() |> Enum.reject(&is_nil/1)
  # end

  def flatten(list) do
    Enum.reduce(list, [], fn x, acc ->
      if is_list(x) do
        acc ++ flatten(x)
      else
        if is_nil(x), do: acc, else: acc ++ [x]
      end
    end)
  end
end


IO.inspect(FlattenArray.flatten([1, [2], 3, nil]))
