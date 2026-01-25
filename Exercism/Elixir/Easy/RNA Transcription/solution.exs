defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """

  @dna_to_rna_map %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U,
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, & @dna_to_rna_map[&1])
  end
end


IO.inspect(RnaTranscription.to_rna(~c"ACTG"))
