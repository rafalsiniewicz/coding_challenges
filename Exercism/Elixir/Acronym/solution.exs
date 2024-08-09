defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  # @spec abbreviate(String.t()) :: String.t()
  # def abbreviate(string) do
  #   string
  #   |> String.replace(~r/\p{P}(?<!-)/, "")
  #   |> String.split(~r/\s+|-/, trim: true)
  #   |> Enum.reduce("", fn word, acc ->
  #     acc <> (word
  #     |> String.first()
  #     |> String.upcase())
  #   end)
  # end
  # @spec abbreviate(String.t()) :: String.t()
  # def abbreviate(string) do
  #   string
  #   |> String.replace([".", ",", "'", "\"", "?", "!", "(", ")", "[", "]", "{", "}", "...", ":", ";", "_"], "")
  #   |> String.split(["-", " "], trim: true)
  #   |> Enum.reduce("", fn word, acc ->
  #         acc <> (word
  #         |> String.first()
  #         |> String.upcase())
  #       end)
  # end
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/[^\w\s-]|_/, "")
    |> String.split(~r/\s+|-/, trim: true)
    |> Enum.reduce("", fn word, acc ->
      acc <> (word
      |> String.first()
      |> String.upcase())
    end)
  end
end


# IO.inspect(Acronym.abbreviate("As Soon As Possible"))
# IO.inspect(Acronym.abbreviate("Liquid-crystal display"))
# IO.inspect(Acronym.abbreviate("Thank George It's Friday!"))
# IO.inspect(Acronym.abbreviate("First in, First out"))
IO.inspect(Acronym.abbreviate("Something - I made up from thin air"))
