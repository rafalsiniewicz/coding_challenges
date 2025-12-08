defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count(~c"AATAA", ?A)
  4

  iex> NucleotideCount.count(~c"AATAA", ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, fn s, acc -> if s == nucleotide, do: acc + 1, else: acc end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram(~c"AATAA")
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map() | :error
  def histogram(strand) do
    if Enum.any?(strand, fn s -> s not in @nucleotides end) do
      :error
    else
      %{?A => count(strand, ?A), ?C => count(strand, ?C), ?G => count(strand, ?G), ?T => count(strand, ?T) }
    end
  end
end

IO.inspect(NucleotideCount.histogram(~c"AATAA"))
