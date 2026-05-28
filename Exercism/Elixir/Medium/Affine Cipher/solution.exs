defmodule AffineCipher do
  @alphabet ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @omit ~w(` ! @ # $ % ^ & * \( \) _ - + = [ { } ] : ; " ' | \\ , < . > ? /) ++ [" "]

  @typedoc """
  A type for the encryption key
  """
  @type key() :: %{a: integer, b: integer}

  @doc """
  Encode an encrypted message using a key
  """
  @spec encode(key :: key(), message :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def encode(%{a: a, b: b}, message) do
    if rem(a, 2) == 0 or rem(a, 13) == 0 do
      {:error, "a and m must be coprime."}
    else
      message
      |> String.downcase()
      |> String.replace(@omit, "")
      |> String.codepoints()
      |> Enum.map(& encrypt((if &1 in @alphabet, do: Enum.find_index(@alphabet, fn l -> l == &1 end), else: &1), a, b, length(@alphabet)))
      |> Enum.chunk_every(5, 5)
      |> then(& {:ok, Enum.join(&1, " ")})
    end
  end

  defp encrypt(i, a, b, m) when i >= 0 and i <= 25 do
    Enum.at(@alphabet, rem(a * i + b, m))
  end

  defp encrypt(letter, _a, _b, _m), do: letter

  @doc """
  Decode an encrypted message using a key
  """
  @spec decode(key :: key(), encrypted :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def decode(%{a: a, b: b}, encrypted) do
    if rem(a, 2) == 0 or rem(a, 13) == 0 do
      {:error, "a and m must be coprime."}
    else
      m = length(@alphabet)
      mmi = mmi(a, m)

      encrypted
      |> String.replace(" ", "")
      |> String.codepoints()
      |> Enum.map(& decrypt((if &1 in @alphabet, do: Enum.find_index(@alphabet, fn l -> l == &1 end), else: &1), mmi, b, m))
      |> then(& {:ok, Enum.join(&1, "")})
    end
  end

  defp decrypt(y, mmi, b, m) when y >= 0 and y <= 25 do
    Enum.at(@alphabet, rem(mmi * (y - b), m))
  end

  defp decrypt(letter, _mmi, _b, _m), do: letter

  defp mmi(a, m) do
    Enum.reduce_while(1..m, nil, fn n, acc ->
      if rem(a * n, m) == 1, do: {:halt, n}, else: {:cont, acc}
    end)
  end
end

# key = %{a: 5, b: 7}
# phrase = "yes"
# AffineCipher.encode(key, phrase) |> IO.inspect()


# key = %{a: 21, b: 3}
# phrase = "OMG"
# AffineCipher.encode(key, phrase) |> IO.inspect()


# key = %{a: 25, b: 47}
# phrase = "O M G"
# AffineCipher.encode(key, phrase) |> IO.inspect()


# key = %{a: 11, b: 15}
# phrase = "mindblowingly"
# AffineCipher.encode(key, phrase) |> IO.inspect()


# key = %{a: 3, b: 4}
# phrase = "Testing,1 2 3, testing."
# AffineCipher.encode(key, phrase) |> IO.inspect()


key = %{a: 19, b: 13}
phrase = "kqlfd jzvgy tpaet icdhm rtwly kqlon ubstx"
AffineCipher.decode(key, phrase) |> IO.inspect()
