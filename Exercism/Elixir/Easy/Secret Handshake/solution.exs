defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  # @range_action [
  #   {1..31//2, "wink"},
  #   {2..31//4, "double blink"},
  #   {3..31//4, "double blink"},
  #   {4..31//8, "close your eyes"},
  #   {5..31//8, "close your eyes"},
  #   {6..31//8, "close your eyes"},
  #   {7..31//8, "close your eyes"},
  #   {8..15, "jump"},
  #   {24..31, "jump"}
  # ]

  # @spec commands(code :: integer) :: list(String.t())
  # def commands(code) do
  #   actions = Enum.reduce(@range_action, [], fn {range, action}, acc ->
  #     if code in range do
  #       acc ++ [action]
  #     else
  #       acc
  #     end
  #   end)
  #   if code >= 16 do
  #     Enum.reverse(actions)
  #   else
  #     actions
  #   end
  # end

  # @spec commands(code :: integer) :: list(String.t())
  # def commands(code) do
  #   actions = if code in 1..31//2, do: ["wink"], else: []
  #   actions =  if code in List.flatten([Range.to_list(2..31//4), Range.to_list(3..31//4)]), do: actions ++ ["double blink"], else: actions
  #   actions =  if code in List.flatten([Range.to_list(4..31//8), Range.to_list(5..31//8), Range.to_list(6..31//8), Range.to_list(7..31//8)]), do: actions ++ ["close your eyes"], else: actions
  #   actions =  if code in List.flatten([Range.to_list(8..15), Range.to_list(24..31)]), do: actions ++ ["jump"], else: actions
  #   if code >= 16, do: Enum.reverse(actions), else: actions
  # end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce([], fn {digit, i}, acc ->
      action(i, digit, acc)
    end)
  end

  defp action(0, 1, acc), do: acc ++ ["wink"]
  defp action(1, 1, acc), do: acc ++ ["double blink"]
  defp action(2, 1, acc), do: acc ++ ["close your eyes"]
  defp action(3, 1, acc), do: acc ++ ["jump"]
  defp action(4, 1, acc), do: Enum.reverse(acc)
  defp action(_, _, acc), do: acc
end



IO.inspect(SecretHandshake.commands(9))
