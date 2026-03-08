defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  # @spec isogram?(String.t()) :: boolean
  # def isogram?(sentence) do
  #   sentence
  #   |> String.replace([" ", "-"], "")
  #   |> String.downcase()
  #   |> String.codepoints()
  #   |> Enum.frequencies()
  #   |> Enum.any?(& elem(&1, 1) > 1)
  #   |> case do
  #     true -> false
  #     _ -> true
  #   end
  # end

  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace([" ", "-"], "")
    |> String.downcase()
    |> String.codepoints()
    |> then(& Enum.uniq(&1) == &1)
  end
end

IO.inspect(Isogram.isogram?("lumberjacks"))
IO.inspect(Isogram.isogram?("background"))
IO.inspect(Isogram.isogram?("downstream"))
IO.inspect(Isogram.isogram?("six-year-old"))
IO.inspect(Isogram.isogram?("isograms"))
