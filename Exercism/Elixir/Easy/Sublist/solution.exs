defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      is_sublist?(a, b) -> :sublist
      is_sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp is_sublist?([], _), do: true
  defp is_sublist?(a, b) do
    a in Enum.chunk_every(b, length(a), 1, :discard)
  end


  # def compare([], []), do: :equal
  # def compare(_a, []), do: :superlist
  # def compare([], _b), do: :sublist
  # def compare(a, b) do
  #   if a == b do
  #     :equal
  #   else
  #     longer_shorter = cond do
  #       length(a) == length(b) -> :equal
  #       length(a) > length(b) -> {a, b}
  #       true -> {b, a}
  #     end
  #     if longer_shorter == :equal do
  #       :unequal
  #     else
  #       {longer, shorter} = longer_shorter
  #       longer_str = Enum.join(longer, ",") <> ","
  #       shorter_str = Enum.join(shorter, ",") <> ","
  #       IO.inspect({longer_str, shorter_str})
  #       case {longer, String.contains?(longer_str, shorter_str)} do
  #         {^a, true} -> :superlist
  #         {^b, true} -> :sublist
  #         _ -> :unequal
  #       end
  #     end
  #   end
  # end

  # def compare([], []), do: :equal
  # def compare(_a, []), do: :superlist
  # def compare([], _b), do: :sublist
  # def compare(a, b) do
  #   {shorter, longer} = cond do
  #     length(a) > length(b) -> {b, a}
  #     true -> {a, b}
  #   end

  #   if shorter == longer do
  #     :equal
  #   else
  #     longer
  #     |> Enum.reduce_while({0, :equal}, fn longer_elem, {shorter_iter, result} ->
  #       if longer_elem === Enum.at(shorter, shorter_iter) do
  #         if result == :unequal and shorter_iter == length(shorter) - 1 do
  #           {:halt, {shorter_iter + 1, :sublist}}
  #         else
  #           if shorter_iter == length(shorter) - 1 do
  #             if shorter_iter == length(longer) - 1 do
  #               {:halt, {shorter_iter, result}}
  #             else
  #               {:halt, {shorter_iter, :sublist}}
  #             end
  #           else
  #             {:cont, {shorter_iter + 1, result}}
  #           end
  #         end
  #       else
  #         shorter_iter = if shorter_iter > 0 and longer_elem != Enum.at(shorter, shorter_iter - 1), do: 0, else: shorter_iter
  #         {:cont, {shorter_iter, if(result == :equal, do: :unequal, else: result)}}
  #       end
  #     end)
  #     |> then(fn {_, result} ->
  #       case {shorter, result} do
  #         {^b, :sublist} -> :superlist
  #         _ -> result
  #       end
  #     end)
  #   end
  # end
end


{time_us, result} =
  :timer.tc(fn ->
    IO.inspect(Sublist.compare([], []))
    IO.inspect(Sublist.compare([1, 2, 3], []))
    IO.inspect(Sublist.compare([], [1, 2, 3]))
    IO.inspect(Sublist.compare([1, 2, 3], [1, 2, 3, 4, 5]))
    IO.inspect(Sublist.compare([3, 4, 5], [1, 2, 3, 4, 5]))
    IO.inspect(Sublist.compare([3, 4], [1, 2, 3, 4, 5]))
    IO.inspect(Sublist.compare([1, 2, 3], [1, 2, 3]))
    IO.inspect(Sublist.compare([1, 2, 3, 4, 5], [2, 3, 4]))
    IO.inspect(Sublist.compare([1, 2, 4], [1, 2, 3, 4, 5])) # here unequal should be but is sublist
    IO.inspect(Sublist.compare([1, 2, 3], [1, 3, 2]))
    IO.inspect(Sublist.compare(Enum.to_list(1..10_000_000), [3, 4, 5]))
    IO.inspect(Sublist.compare([3, 4, 5], Enum.to_list(1..10_000_000)))
    IO.inspect(Sublist.compare(Enum.to_list(1..10_000_000), Enum.to_list(1..10_000_000)))
    IO.inspect(Sublist.compare([1, 2, 5], [0, 1, 2, 3, 1, 2, 5, 6]))
    IO.inspect(Sublist.compare([1, 1, 2], [0, 1, 1, 1, 2, 1, 2]))
    IO.inspect(Sublist.compare([1], [1.0, 2]))
    IO.inspect(Sublist.compare([1, 3], [1, 2, 3]))
  end)

IO.puts("Time: #{time_us} μs")
