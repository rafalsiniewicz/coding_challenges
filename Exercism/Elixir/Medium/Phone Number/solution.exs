defmodule PhoneNumber do
  @digits %{
    0 => "zero",
    1 => "one"
  }

  @to_omit [" ", "(", ")", "-", "+", ",", "."]
  @str_digits ~w(0 1 2 3 4 5 6 7 8 9)

  @doc """
  Remove formatting from a phone number if the given number is valid. Return an error otherwise.
  """
  @spec clean(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def clean(raw) do
    raw
    |> String.replace(@to_omit, "")
    |> check_length()
    |> case do
      {:ok, str} -> check_digits(str)
      {:error, _} = err -> err
    end
  end

  defp check_length(str) do
    length = String.length(str)
    length_is_10 = length == 10
    length_is_11 = length == 11
    cond do
      (length_is_10 or length_is_11) and Enum.any?(String.codepoints(str), & &1 not in @str_digits) -> {:error, "must contain digits only"}
      length_is_10 -> {:ok, str}
      length_is_11 and String.at(str, 0) != "1" -> {:error, "11 digits must start with 1"}
      length_is_11 -> {:ok, String.slice(str, 1, length)}
      length < 10 -> {:error, "must not be fewer than 10 digits"}
      true -> {:error, "must not be greater than 11 digits"}
    end
  end

  defp check_digits(str) do
    first = String.at(str, 0) |> String.to_integer()
    fourth = String.at(str, 3) |> String.to_integer()
    cond do
      first not in 2..9 -> {:error, "area code cannot start with #{@digits[first]}"}
      fourth not in 2..9 -> {:error, "exchange code cannot start with #{@digits[fourth]}"}
      true -> {:ok, str}
    end
  end
end

PhoneNumber.clean("(223) 456-7890") |> IO.inspect() # "2234567890"
