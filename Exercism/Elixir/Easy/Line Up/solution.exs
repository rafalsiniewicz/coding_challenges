defmodule LineUp do
  @doc """
  Formats a full ticket sentence for the given name and number, including
  the person's name, the ordinal form of the number, and fixed descriptive text.
  """
  @spec format(name :: String.t(), number :: pos_integer()) :: String.t()
  def format(name, number) do
    string_number = number |> to_string()
    ordinal =
      cond do
        String.last(string_number) == "1" and not String.ends_with?(string_number, "11") -> "st"
        String.last(string_number) == "2" and not String.ends_with?(string_number, "12") -> "nd"
        String.last(string_number) == "3" and not String.ends_with?(string_number, "13") -> "rd"
        true -> "th"
    end

    "#{name}, you are the #{number}#{ordinal} customer we serve today. Thank you!"
  end
end


IO.inspect(LineUp.format("Mary", 1))
IO.inspect(LineUp.format("John", 12))
IO.inspect(LineUp.format("Dahir", 162 ))
