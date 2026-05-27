defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  @spec chain?(dominoes :: [domino]) :: boolean
  def chain?(dominoes) do
    Enum.reduce_while(1..length(dominoes), {false, dominoes}, fn _, {result, list} ->
      case do_chain(list, []) do
        nil -> {:cont, {result, move_in_list(list)}}
        [] -> {:halt, {true, list}}
        domino ->
          if List.first(domino) |> elem(0) == List.last(domino) |> elem(1), do: {:halt, {true, list}}, else: {:cont, {result, move_in_list(list)}}
      end
    end) |> elem(0)
  end

  defp do_chain([], acc), do: acc

  defp do_chain([head | tail] = _dominoes, []) do
    do_chain(tail, [head])
  end

  defp do_chain(dominoes, acc) do
    last = List.last(acc)
    matching = Enum.find(dominoes, & elem(&1, 0) == elem(last, 1))
    matching = if not is_nil(matching), do: {:ok, matching}, else: {:reverse, Enum.find(dominoes, & elem(&1, 1) == elem(last, 1)) |> reverse()}
    case matching do
      {_, nil} -> nil
      {atom, match} -> do_chain(List.delete(dominoes, (if atom == :ok, do: match, else: match |> reverse())), acc ++ [match])
    end
  end

  defp reverse(nil), do: nil
  defp reverse({first, second}) do
    {second, first}
  end

  defp move_in_list(list) do
    {head, new_list} = List.pop_at(list, 0)
    new_list ++ [head]
  end
end

# Dominoes.chain?([{2, 1}, {2, 3}, {1, 3}]) |> IO.inspect()
# Dominoes.chain?([{1, 2}, {4, 1}, {2, 3}]) |> IO.inspect()
# Dominoes.chain?([]) |> IO.inspect()
Dominoes.chain?([{1, 2}, {2, 3}, {3, 1}, {2, 4}, {2, 4}]) |> IO.inspect()
