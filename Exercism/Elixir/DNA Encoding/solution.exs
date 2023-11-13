defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      true -> nil
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      true -> nil
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], bit_str) do
    bit_str
  end

  defp do_encode([head | tail], bit_str) do
    do_encode(tail, <<bit_str::bitstring, encode_nucleotide(head)::size(4)>>)
  end

  def decode(dna) do
    do_decode(dna, ~c"")
  end

  defp do_decode(<<>>, char_list) do
    char_list
  end

  defp do_decode(<<head::size(4), tail::bitstring>>, char_list) do
    do_decode(tail, char_list ++ [decode_nucleotide(head)])
  end

end

# 1
1 = DNA.encode_nucleotide(?A)

# 2
65 = DNA.decode_nucleotide(0b0001)

# 3
# IO.inspect(DNA.encode(~c"AC GT"))
<<18, 4, 8::size(4)>> = DNA.encode(~c"AC GT")

# 4
# IO.inspect(DNA.decode(<<132, 2, 1::size(4)>>))
~c"TG CA" = DNA.decode(<<132, 2, 1::size(4)>>)
