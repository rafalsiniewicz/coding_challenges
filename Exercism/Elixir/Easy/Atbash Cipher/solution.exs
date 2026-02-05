defmodule Atbash do
  @encoding %{
    "a" => "z",
    "b" => "y",
    "c" => "x",
    "d" => "w",
    "e" => "v",
    "f" => "u",
    "g" => "t",
    "h" => "s",
    "i" => "r",
    "j" => "q",
    "k" => "p",
    "l" => "o",
    "m" => "n",
    "n" => "m",
    "o" => "l",
    "p" => "k",
    "q" => "j",
    "r" => "i",
    "s" => "h",
    "t" => "g",
    "u" => "f",
    "v" => "e",
    "w" => "d",
    "x" => "c",
    "y" => "b",
    "z" => "a",
    "0" => "0",
    "1" => "1",
    "2" => "2",
    "3" => "3",
    "4" => "4",
    "5" => "5",
    "6" => "6",
    "7" => "7",
    "8" => "8",
    "9" => "9"
  }

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.replace(" ", "")
    |> String.codepoints()
    |> Enum.map(& Map.get(@encoding, &1))
    |> Enum.filter(& not is_nil(&1))
    |> Enum.chunk_every(5, 5)
    |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.replace(" ", "")
    |> String.codepoints()
    |> Enum.map(& Map.get(@encoding, &1, &1))
    |> Enum.join()
  end
end

IO.inspect(Atbash.encode("completely insecure"))
IO.inspect(Atbash.decode("xlnko vgvob rmhvx fiv"))
IO.inspect(Atbash.encode("OMG"))
