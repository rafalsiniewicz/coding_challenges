defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""
  def recite(strings = [first | _tail]) do
    do_recite(strings) <> "And all for the want of a #{first}.\n"
  end

  defp do_recite([first | tail = [second | _]]) do
    "For want of a #{first} the #{second} was lost.\n" <> do_recite(tail)
  end
  defp do_recite([_last]), do: ""
end

Proverb.recite(["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]) |> IO.inspect()
