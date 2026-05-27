defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    (list |> Tuple.to_list()) ++ [elem]
    |> List.to_tuple()
  end

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list) do
    list
    |> Tuple.to_list()
    |> length()
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    list
    |> count() == 0
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    case empty?(list) do
      true -> {:error, :empty_list}
      _ -> {:ok, list |> Tuple.to_list() |> List.last()}
    end
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) do
    case empty?(list) do
      true -> {:error, :empty_list}
      _ -> {:ok, Tuple.delete_at(list, count(list) - 1)}
    end
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    case empty?(list) do
      true -> {:error, :empty_list}
      _ -> {:ok, list |> Tuple.to_list() |> List.last(), Tuple.delete_at(list, count(list) - 1)}
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    list
    |> Enum.reverse()
    |> List.to_tuple()
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    list
    |> Tuple.to_list()
    |> Enum.reverse()
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    list
    |> Tuple.to_list()
    |> Enum.reverse()
    |> List.to_tuple()
  end
end



list = LinkedList.from_list([1, 2, 3]) |> LinkedList.reverse() |> IO.inspect()
LinkedList.to_list(list) == [3, 2, 1]
