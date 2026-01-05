defmodule ProteinTranslation do
  @codon_to_protein_map %{"UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UUA" => "Leucine",
  "UUG" => "Leucine",
  "AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine",
  "UGG" => "Tryptophan",
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP"}


  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    do_of_rna(rna, [])
  end

  defp do_of_rna("", acc), do: {:ok, acc}

  defp do_of_rna(rna, acc) do
    {codon, rest} = String.split_at(rna, 3)

    codon
    |> of_codon()
    |> case do
      {:ok, "STOP"} -> {:ok, acc}
      {:ok, protein} -> do_of_rna(rest, acc ++ [protein])
      {:error, _} -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case @codon_to_protein_map[codon] do
      nil -> {:error, "invalid codon"}
      protein -> {:ok, protein}
    end
  end
end


IO.inspect(ProteinTranslation.of_rna("AUGUUUUCUUAAAUG"))
