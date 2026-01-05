defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "strands must be of equal length"}
  end

  def hamming_distance(strand1, strand2) do
    result = Enum.reduce(0..length(strand1)-1, 0, fn i, acc ->
      if Enum.at(strand1, i) != Enum.at(strand2, i) do
        acc + 1
      else
        acc
      end
    end)
    {:ok, result}
  end

  # def hamming_distance(_strand1 = [], _strand2 = []) do
  #   {:ok, 0}
  # end

  # def hamming_distance(_strand1 = [head1], _strand2 = [head2]) do
  #   if head1 != head2 do
  #     {:ok, 1}
  #   else
  #     {:ok, 0}
  #   end
  # end

  # def hamming_distance(_strand1 = [head1 | tail1], _strand2 = [head2 | tail2]) do
  #   result = if head1 != head2, do: 1 + elem(hamming_distance(tail1, tail2), 1), else: elem(hamming_distance(tail1, tail2), 1)
  #   {:ok, result}
  # end
end

Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC") |> IO.inspect()
Hamming.hamming_distance(~c"GAGCCTACTAACGGGAT", ~c"CATCGTAATGACGGCCT") |> IO.inspect()
